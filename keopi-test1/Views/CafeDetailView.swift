//
//  CafeDetailView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import SwiftUI

struct CafeDetailView: View {
    
    let cafeBar: Cafe
    var body: some View {
        VStack{
            Image(uiImage: cafeBar.picture.load())
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.yellow)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 500, height: 320, alignment: .center)
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 150, alignment: .center)
                        .padding()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10, x: 1, y: 2)
                        .overlay(
                            VStack(spacing: 40){
                                HStack(spacing: 190){
                                    Text(cafeBar.name)
                                        .frame(alignment: .leading)
                                        .font(.title3)
//                                    NavigationLink(
//                                        destination: CalendarView(),
//                                        label: {
//                                            Image(systemName: "calendar")
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 30, height: 30, alignment: .trailing)
//                                                .foregroundColor(.yellow)
//                                        })
                                }
                                
                                HStack(spacing: 35){
                                    VStack{
                                        Image(systemName: "clock")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .center)
                                        
                                        Text("\(cafeBar.startingWorkTime)-\(cafeBar.endingWorkTime)")
                                            .font(Font.system(size: 11))
                                            .foregroundColor(.secondary)
                                            .fontWeight(.semibold)
                                    }
                                    VStack{
                                        Image("age")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .center)
                                        
                                        Text(cafeBar.age)
                                            .font(Font.system(size: 11))
                                            .foregroundColor(.secondary)
                                            .fontWeight(.semibold)
                                    }
                                    VStack{
                                        Image(systemName: "location")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .center)
                                        
                                        Text(cafeBar.location)
                                            .font(Font.system(size: 11))
                                            .foregroundColor(.secondary)
                                            .fontWeight(.semibold)
                                    }
                                    VStack{
                                        Image("table")
                                            .resizable()
                                            .frame(width: 30, height: 30, alignment: .center)
                                        
                                        Text(cafeBar.capacity)
                                            .font(Font.system(size: 11))
                                            .foregroundColor(.secondary)
                                            .fontWeight(.semibold)
                                    }
                                }
                            }
                        )
                        .padding(.top, -250)
                    
                    HStack {
                        Text("Description")
                            .padding()
                            .font(Font.system(size: 20))
                        Spacer()
                        
                        HStack(spacing: 15) {
                            Link(destination: URL(string: "https://www.facebook.com/luka.vujnovac/")!, label: {
                                Image("facebook")
                                    .resizable()
                                    .frame(width: 25, height: 25, alignment: .center)
                            })
                            Link(destination: URL(string: "https://www.instagram.com/lukavujnovac/")!, label: {
                                Image("instagram")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                            })
                            
                        }.padding()
                        
                    }.padding(.top, -70)
                    
                    HStack {
                        Text(cafeBar.bio)
                            .lineLimit(3)
                            .padding()
                            .font(Font.system(size: 12))
                        Spacer()
                    }
                    
                    HStack(spacing: 60){
                        HStack {
                            Image(systemName: "music.note")
                                .resizable()
                                .frame(width: 15, height: 25, alignment: .center)
                            Text(cafeBar.music)
                        }
                        HStack{
                            Image("terrace")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                            Text(cafeBar.terrace ? "Terrace" : "No Terrace")
                        }
                    }
                    
                    HStack{
                        Text("Activities")
                            .padding()
                        Spacer()
                    }
                    
                    HStack(spacing: 25){
                        Image("smoking")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(cafeBar.smoking ? Color.yellow : Color.black)
                        Image("hookah")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(cafeBar.hookah ? Color.yellow : Color.black)
                        Image("betting")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(cafeBar.betting ? Color.yellow : Color.black)
                        Image("billiard")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(cafeBar.billiards ? Color.yellow : Color.black)
                        Image("darts")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(cafeBar.dart ? Color.yellow : Color.black)
                        
                        Image("playground")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(cafeBar.playground ? Color.yellow : Color.black)
                    }.padding()
                    Spacer()
                }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeDetailView()
//    }
//}
