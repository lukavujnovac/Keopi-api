//
//  CalendarView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 09.09.2021..
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var eventViewModel = EventViewModel()
    @State private var date = Date()
    @State private var show: Bool = false
    //    var events = TestData.events
    var body: some View {
        ZStack{
            VStack {
                Form {
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.yellow)
                        .shadow(color: .gray, radius: 10, x: 1, y: 2)
                        .onChange(of: date, perform: { value in
                            eventViewModel.fetchEvents(date: "\(formatDay(date: date)).\(formatMont(date: date)).\(formatYear(date: date)).")
                        })
                    
                    Text("selected \(formatDay(date: date)).\(formatMont(date: date)).\(formatYear(date: date)).")  
                        .hidden()
                }
                VStack {
                    HStack{
                        if let safeEvents = eventViewModel.events {
                            ForEach(safeEvents, id: \.self) { event in
                                HStack{
                                    EventView(event: event)
                                        .onTapGesture {
                                            show.toggle()
                                        }
                                }
                            }   
                        }
                    }
                }   
            }
            VStack{
                Spacer()
                CustomActionSheet().offset(y: self.show ? 0 : UIScreen.main.bounds.height)
            }.edgesIgnoringSafeArea(.bottom)
            .background((self.show ? Color.black.opacity(0.3) : Color.clear)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                self.show.toggle()
                            })
            .edgesIgnoringSafeArea(.bottom)
            
        }.accentColor(.black)
        .navigationTitle(Text("Calendar"))
        .animation(.default)
        
    }
    
    
    private func formatMont(date: Date) -> String {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        let month = components.month
        
        if month! < 10 {
            return ("0\(month!)")
        }else {
            return ("\(month!)")
        }
    }
    
    private func formatYear(date: Date) -> String {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        let year = components.year
        
        return ("\(year!)")
    }
    
    private func formatDay(date: Date) -> String {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let day = components.day
        
        if day! < 10 {
            return ("0\(day!)")
        }else {
            return ("\(day!)")
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



