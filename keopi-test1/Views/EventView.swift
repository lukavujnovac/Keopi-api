//
//  EventView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 16.09.2021..
//

import SwiftUI

struct EventView: View {
    
    let event: Event
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150, alignment: .center)
                    .shadow(color: .gray, radius: 10, x: 1, y: 2)
                    .overlay(
                        VStack(spacing: 30){
                            VStack(spacing: 7) {
                                Text(event.performer)
                                    .foregroundColor(.black)
                                Capsule()
                                    .frame(width: 70, height: 2, alignment: .center)
                                    .foregroundColor(.yellow)
                            }
                            VStack(alignment: .leading) {
                                HStack{
                                    Image(systemName: "calendar")
                                        .foregroundColor(.black)
                                    Text(event.date)
                                        .foregroundColor(.black)
                                }
                                HStack{
                                    Image("money")
                                        .renderingMode(.template)
                                        .resizable()
                                        .foregroundColor(.black)
                                        .frame(width: 20, height: 20, alignment: .center)
                                    Text(event.price)
                                        .foregroundColor(.black)
                                    
                                }
                            }
                        }
                    )
//            VStack{
//                Spacer()
//                CustomActionSheet().offset(y: self.show ? 0 : UIScreen.main.bounds.height)
//            }.edgesIgnoringSafeArea(.bottom)
//            .background((self.show ? Color.black.opacity(0.3) : Color.clear)
//                            .edgesIgnoringSafeArea(.all)
//                            .onTapGesture {
//                                self.show.toggle()
//                            })
//            .edgesIgnoringSafeArea(.bottom)
        }.animation(.default)
    }
}

//struct EventView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventView()
//    }
//}

struct CustomActionSheet: View {
    
    @State var show1: Bool = true
    var body: some View {
        VStack(spacing: 15) {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 300, alignment: .center)
                .foregroundColor(.white)
                .overlay(
                    VStack(spacing: 20){
                        VStack(spacing: 7) {
                            Text("Cafe Bar Shpitza")
                            Capsule()
                                .foregroundColor(.yellow)
                                .frame(width: 30, height: 2, alignment: .center)
                        }.padding()
                        VStack {
                            HStack(spacing: 30){
                                HStack(spacing: 0){
                                    Image(systemName: "calendar")
                                    Text("19:00-02:00")
                                        .font(Font.system(size: 15))
                                }
                                HStack(spacing: 0){
                                    Image("money")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .center)
                                    Text("50kn")
                                        .font(Font.system(size: 15))
                                }
                                HStack(spacing: 0){
                                    Image(systemName: "music.mic")
                                    Text("Vuco")
                                        .font(Font.system(size: 15))
                                }
                            }.padding()
                            
                            VStack(spacing: 10){
                                HStack {
                                    Text("description")
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt")
                                    .fontWeight(.light)
                                    .lineLimit(4)
                            } .padding(.leading, 40)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.yellow)
                                .frame(width: 200, height: 35, alignment: .center)
                                .overlay(
                                    Text("Show cafe!")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                )
                        }
                    }
                )
        }.padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(25)
    }
}
