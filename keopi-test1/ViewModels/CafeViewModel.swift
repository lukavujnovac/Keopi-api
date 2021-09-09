//
//  CafeViewModel.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import Foundation

class CafeViewModel: ObservableObject {
    
    @Published var cafes: CafeListModel?
    
    func fetch() {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/cafes?seed=\(Int.random(in: 1...999))") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let cafes = try JSONDecoder().decode(CafeListModel.self, from: data)
                DispatchQueue.main.async {
                    self?.cafes = cafes
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
