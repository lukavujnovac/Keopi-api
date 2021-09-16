//
//  ContentView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 01.09.2021..
//

import SwiftUI

struct ContentView: View {
    @StateObject var cafeViewModel = CafeViewModel()
    @StateObject var promoCafeViewModel = PromoCafeViewModel()
    @State private var selectedTab: Int = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.systemYellow
    } 
    
    var body: some View {
        ZStack{
            BackgroundView()
            NavigationView {
                ZStack{
                    ScrollView{
                        VStack{
                            VStack(spacing: -20){
                                HStack {
                                    Text("Promo")
                                        .padding()
                                        .padding(.leading, 20)
                                        .font(Font.system(size: 25, weight: .bold, design: .default))
                                    Spacer()
                                }
                                ScrollView(.horizontal){
                                    LazyHStack(spacing: 20){
                                        if let safePromoCafes = promoCafeViewModel.promoCafes {
                                            ForEach(safePromoCafes, id: \.self) { safePromoCafe in
                                                HStack{
                                                    NavigationLink(
                                                        destination: CafeDetailView(cafeBar: safePromoCafe),
                                                        label: {
                                                            PromoCafeView(promoCafe: safePromoCafe)
                                                        })
                                                }
                                            }
                                        }
                                    }.frame(height: 250, alignment: .center)
                                    .padding(20)
                                    .padding(.leading, 20)
                                }
                            }
                            
                            Spacer()
                            
                            VStack {
                                Picker("", selection: $selectedTab) {
                                    Text("Kafići").tag(0)
                                    Text("Spremljeno").tag(1)
                                }.padding()
                                .pickerStyle(SegmentedPickerStyle())
                                .shadow(color: .black, radius: 10, x: 1, y: 2)
                                
                                
                                if selectedTab == 0 {
                                    VStack(spacing: 20){
                                        if let safeCafes = cafeViewModel.cafes?.cafes {
                                            ForEach(safeCafes, id: \.self) { cafe in
                                                HStack{
                                                    NavigationLink(
                                                        destination: CafeDetailView(cafeBar: cafe),
                                                        label: {
                                                            CafeCellView(cafe: cafe)
                                                        })
                                                }
                                            }
                                            
                                        }
                                    }
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
                    CalendarButton()
                }.onAppear{
                    cafeViewModel.fetch()
                    promoCafeViewModel.fetch()
                }
                .navigationBarHidden(true)
            }.accentColor(.black)
        }
    }
}

struct CafeBarListtest_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {return UIImage()}
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        }catch {
            //
        }
        return UIImage()
    }
}

struct PromoCafeView: View {
    
    let promoCafe: Cafe
    
    var body: some View {
        ZStack {
            //pozadinska boja
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .black, radius: 10, x: 1, y: 2)
                .overlay(
                    
                    VStack {
                        Image(uiImage: promoCafe.picture.load())
                            .resizable()
                            .cornerRadius(25)
                        
                        Text(promoCafe.name)
                            .font(.system(size: 16))
                            .foregroundColor(Color(.darkGray))
                            .padding(.bottom, -7)
                        
                        Capsule()
                            .frame(width: 40, height: 2, alignment: .center)
                            .foregroundColor(.yellow)
                        
                        Text(promoCafe.location)
                            .font(.system(size: 12))
                            .foregroundColor(Color(.darkGray))
                            .padding(.bottom, 7)
                        
                    })
                .frame(width: 290, height: 210, alignment: .center)
            
            PlusButtonView()
                .padding(.top, 85)
            
        }
    }
}

struct CafeListView: View {
    
    @StateObject var cafeViewModel = CafeViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            if let safeCafes = cafeViewModel.cafes?.cafes {
                ForEach(safeCafes, id: \.self) { cafe in
                    HStack{
                        NavigationLink(
                            destination: CafeDetailView(cafeBar: cafe),
                            label: {
                                CafeCellView(cafe: cafe)
                            })
                    }
                }
                
            }
        }
    }
}


struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color("background-color")]), startPoint: .leading, endPoint: .trailing)
            .ignoresSafeArea()
    }
}

struct CalendarButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(
                    destination: CalendarView(),
                    label: {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.yellow)
                            .frame(width: 60, height: 60)
                            .shadow(color: .black, radius: 10, x: 1, y: 2)
                            .overlay(
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(.white)
                            )
                    })
                
            }.padding()
        }.padding()
    }
}
