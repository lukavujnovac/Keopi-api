//
//  CalendarView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 09.09.2021..
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    var body: some View {
            VStack(alignment: .leading) {
                Text("Calendar")
                    .font(Font.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                    .shadow(color: .black, radius: 10, x: 1, y: 2)
                    .padding()
                
                Form {
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.yellow)
                        .shadow(color: .gray, radius: 10, x: 1, y: 2)
                    Text("selected \(formatMont(date: date)) \(formatYear(date: date))")
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

