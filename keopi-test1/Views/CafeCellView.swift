//
//  CafeCellVie.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import Foundation
import SwiftUI

struct CafeCellView: View {
    
    let cafe: Cafe
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 320, height: 120, alignment: .center)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 10, x: 1, y: 2)
                .overlay(
                    ZStack{
                        VStack{
                            HStack{
                                Image(uiImage: cafe.picture.load() )
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130, height: 120, alignment: .center)
                                    .cornerRadius(25)
                                VStack(spacing: 2){
                                    Text("\(cafe.name)")
                                        .frame(width: 170, height: 30, alignment: .center)
                                        .font(Font.system(size: 15, weight: .light, design: .default))
                                        .foregroundColor(.black)
                                    Capsule()
                                        .frame(width: 60, height: 2, alignment: .center)
                                        .foregroundColor(.yellow)
                                    
                                    VStack(alignment: .leading, spacing: 20) {
                                        HStack{
                                            Image(systemName: "location")
                                                .resizable()
                                                .frame(width: 15, height: 15, alignment: .center)
                                                .foregroundColor(.black)
                                            Text(cafe.location)
                                                .font(Font.system(size: 14, weight: .ultraLight, design: .default))
                                                .foregroundColor(.black)
                                                .foregroundColor(.black)
                                            
                                        }
                                        HStack{
                                            Image(systemName: "clock")
                                                .resizable()
                                                .frame(width: 15, height: 15, alignment: .center)
                                                .foregroundColor(.black)
                                            Text("\(cafe.startingWorkTime) - \(cafe.endingWorkTime)")
                                                .font(Font.system(size: 14, weight: .ultraLight, design: .default))
                                                .foregroundColor(.black)
                                            
                                        }.padding(.top, -10)
                                    }.frame(width: 170, height: 50, alignment: .leading)
                                }
                                Spacer()
                            }
                        }
                        
                        HStack {
                            Spacer()
                            VStack {
                                Button(action: {
                                    print("ides ga dodat")
                                }, label: {
                                    Circle()
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .foregroundColor(.yellow)
                                        .overlay(
                                            Text("+")
                                                .font(Font.system(size: 30))
                                                .padding(.bottom, 4)
                                                .foregroundColor(.white)  
                                        )
                                }).animation(.interactiveSpring())
                                Spacer()
                            }
                        }
                    }
                )
            
        }
        
    }
}

