//
//  SearchBarView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 17.09.2021..
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var searchText = ""
    let names = ["Jake", "Ante", "Ivan", "Stipe"]
    
    var body: some View {
        List{
            
            SearchBar(text: $searchText)
            
            ForEach(self.names.filter {
                self.searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchText)
            }, id: \.self) { name in
                Text(name)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}



struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
