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
    var body: some View {
        VStack(alignment: .leading) {
            Text("Calendar")
                .font(Font.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
                .shadow(color: .black, radius: 10, x: 1, y: 2)
                .padding()
            
            VStack {
                Form {
                        DatePicker("Date", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .accentColor(.yellow)
                            .shadow(color: .gray, radius: 10, x: 1, y: 2)
                        Text("selected \(formatMont(date: date)) \(formatYear(date: date))")
                    }
                VStack{
                    if formatMont(date: date) == "9" {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 200, alignment: .center)
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                VStack{
                                    Text("Cafe Bar Shpitza")
                                    Capsule()
                                        .frame(width: 70, height: 2, alignment: .center)
                                        .foregroundColor(.yellow)
                                    HStack{
                                        Image(systemName: "calendar")
                                        Text("19:00")
                                    }
                                    HStack{
                                        Image("money")
                                            .resizable()
                                            .frame(width: 20, height: 20, alignment: .center)
                                        Text("130 kn")
                                    }
                                }
                            )
                    }
                }
            }
        }
    }
    
    private func formatMont(date: Date) -> String {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        let month = components.month
        
        return("\(month!)")
    }
    
    private func formatYear(date: Date) -> String {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        let year = components.year
        
        return ("\(year!)")
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

