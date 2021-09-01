//
//  ContentView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 01.09.2021..
//

import SwiftUI

struct Cafe: Hashable, Codable {
    var id: String
    let address: String
    let billiards: Bool
    let bio: String
    let cityId: String
    let name: String
    let capacity: String
    let betting: Bool
    let latitude: Float
    let longitude: Float
    let areaId: String
    let location: String
    let music: String
    let dart: Bool
    let startingWorkTime: Int
    let age: String
    let smoking: Bool
    let picture: String
    let endingWorkTime: Int
    let terrace: Bool
    let hookah: Bool
    let playground: Bool
    let instagram: String
    let facebook: String
}

struct CafeListModel: Hashable, Codable {
    let cafes: [Cafe]
    let currentPage: Int
    let totalPages: Int
    let pageSize: Int
    let hasPrevious: Bool
    let hasNext: Bool
}

class ViewModel: ObservableObject {
    
    @Published var cafes: CafeListModel?
    
    func fetch() {
        guard let url = URL(string: "https://keopiapi.azurewebsites.net/api/cafes?seed=53") else {return}
        
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

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List{
                if let safeCafes = viewModel.cafes?.cafes {
                    ForEach(safeCafes, id: \.self) { cafe in
                        HStack{
                            Text(cafe.name)
                                .padding(8)
                        }
                    } 
                    
                }
            }.navigationTitle("Cafes")
            .onAppear{
                viewModel.fetch()
            }
        }
        
    }
}

struct CafeBarListtest_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
