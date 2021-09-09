//
//  TabbedView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import SwiftUI

struct TabbedView: View {
    
    @State private var selectedTab: Int = 0
    
    
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                Text("Kafići").tag(0)
                Text("Spremljeno").tag(1)
            }.padding()
            .pickerStyle(SegmentedPickerStyle())
            .foregroundColor(.red)
            
            
            if selectedTab == 0 {
                    CafeListView()
                    .animation(.default)
                    .transition(.move(edge: .leading))
                    .padding()
                        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                            .onEnded({ value in
                                                if value.translation.width < 0 {
                                                    selectedTab = 1
                                                }
                                            }))
            }
            
            if selectedTab == 1 {
                SecondTabView()
                    .animation(.default)
                    .transition(.move(edge: .trailing))
                    .padding()
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onEnded({ value in
                                            if value.translation.width > 0 {
                                                selectedTab = 0
                                            }
                                        }))
            }
            Spacer()
        }
    }
}


struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}

struct SecondTabView: View {
    var body: some View{
        Text("drugi tab")
    }
}
