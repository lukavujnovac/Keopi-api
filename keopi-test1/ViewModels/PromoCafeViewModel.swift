//
//  PromoCafeViewModel.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import Foundation

class PromoCafeViewModel: ObservableObject {
    
    @Published var promoCafes = [Cafe]()
    func fetch() {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/promoCafes") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let promoCafes = try JSONDecoder().decode([Cafe].self, from: data)
                DispatchQueue.main.async {
                    self?.promoCafes = promoCafes
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

