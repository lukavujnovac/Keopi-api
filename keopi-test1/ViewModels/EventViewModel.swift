//
//  EventViewModel.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 13.09.2021..
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var dates = [String]()
    @Published var events = [Event]()
    
    func fetchDates() {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net//api/Events/GetEventDates2MonthsBackAndUp?year=2021&month=9") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let dates = try JSONDecoder().decode([String].self, from: data)
                DispatchQueue.main.async {
                    self?.dates = dates
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchEvents(date: String) {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/Events?dateTime=\(date)") else {return}
        
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

//func fetch() {
//    guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/promoCafes") else {return}
//    
//    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//        guard let data = data, error == nil else {return}
//        
//        do{
//            let promoCafes = try JSONDecoder().decode([Cafe].self, from: data)
//            DispatchQueue.main.async {
//                self?.promoCafes = promoCafes
//            }
//        }catch{
//            print(error)
//        }
//    }
//    task.resume()
//}
