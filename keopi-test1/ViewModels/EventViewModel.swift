//
//  EventViewModel.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 11.09.2021..
//

import Foundation

class EventViewModel: ObservableObject {
    
    @Published var events = [Event]()
    
    func fetch() {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/Events/GetEventDates2MonthsBackAndUp?month=9&year=2021") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let events = try JSONDecoder().decode([Event].self, from: data)
                DispatchQueue.main.async {
                    self?.events = events
                }
            }catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
