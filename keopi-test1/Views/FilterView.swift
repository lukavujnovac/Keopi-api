//
//  FilterView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 20.09.2021..
//

import SwiftUI

struct FilterView: View {
    let fromTo = ["All", "From", "To"]
    @State private var fromToSelected = 0
    
    let hours = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    @State private var selectedHour = 0
    
    @State var smoking: Bool = false
    @State var darts: Bool = false
    @State var billiards: Bool = false
    @State var betting: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 750, alignment: .center)
            .foregroundColor(.white)
            .overlay(
                VStack(spacing: 20) {
                    VStack(spacing: 10) {
                        HStack {
                            Text("Location")
                                .fontWeight(.semibold)
                                .font(Font.system(size: 20, design: .default))
                            Spacer()
                        }.padding(.horizontal, 20)
                        .padding(.top, 10)
                        HStack {
                            Menu {
                                Button(action: {}, label: {
                                    Text("Split")
                                })
                                Button(action: {}, label: {
                                    Text("Kaštela")
                                })
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 300, height: 30, alignment: .center)
                                    .foregroundColor(Color("lightgray"))
                                    .overlay(
                                        HStack{
                                            Text("All")
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                            Image(systemName: "chevron.down.circle.fill")
                                                .foregroundColor(.yellow)
                                                .font(Font.system(size: 18, weight: .bold, design: .default))
                                                .padding()
                                        }
                                    )
                            }
                            Spacer()
                        }.padding(.horizontal, 20)
                        
                    }
                    VStack(alignment: .leading) {
                        HStack(spacing: 100){
                            Picker(selection: $fromToSelected, label: Text(""), content: {
                                ForEach(0 ..< fromTo.count) {
                                    Text(self.fromTo[$0])
                                }
                            }).frame(width: 100, alignment: .center)
                            
                            Picker(selection: $selectedHour, label: Text(""), content: {
                                ForEach(0 ..< hours.count) {
                                    Text(self.hours[$0])
                                }
                            })
                            .frame(width: 100, alignment: .center)
                        }
                    }
                    
                    VStack(spacing: 20){
                        HStack{
                            Image(systemName: "music.note")
                                .frame(width: 25, height: 25, alignment: .center)
                                .padding(.horizontal, 20)
                            
                            Menu {
                                Button(action: {}, label: {
                                    Text("Turbofolk")
                                })
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 30, alignment: .center)
                                    .foregroundColor(Color("lightgray"))
                                    .overlay(
                                        HStack{
                                            Text("All")
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                            Image(systemName: "chevron.down.circle.fill")
                                                .foregroundColor(.yellow)
                                                .font(Font.system(size: 18, weight: .bold, design: .default))
                                                .padding()
                                        }
                                    )
                            }
                            Spacer()
                        }
                        HStack{
                            Image("table")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                                .padding(.horizontal, 20)
                            
                            Menu {
                                Button(action: {}, label: {
                                    Text("<50")
                                })
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 30, alignment: .center)
                                    .foregroundColor(Color("lightgray"))
                                    .overlay(
                                        HStack{
                                            Text("All")
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                            Image(systemName: "chevron.down.circle.fill")
                                                .foregroundColor(.yellow)
                                                .font(Font.system(size: 18, weight: .bold, design: .default))
                                                .padding()
                                        }
                                    )
                            }
                            Spacer()
                        }
                        HStack{
                            Image("age")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                                .padding(.horizontal, 20)
                            
                            Menu {
                                Button(action: {}, label: {
                                    Text("<22")
                                })
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 30, alignment: .center)
                                    .foregroundColor(Color("lightgray"))
                                    .overlay(
                                        HStack{
                                            Text("All")
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                            Image(systemName: "chevron.down.circle.fill")
                                                .foregroundColor(.yellow)
                                                .font(Font.system(size: 18, weight: .bold, design: .default))
                                                .padding()
                                        }
                                    )
                            }
                            Spacer()
                        }
                        HStack{
                            Image("terrace")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                                .padding(.horizontal, 20)
                            
                            Menu {
                                Button(action: {}, label: {
                                    Text("Terrace")
                                })
                                Button(action: {}, label: {
                                    Text("No Terrace")
                                })
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: 30, alignment: .center)
                                    .foregroundColor(Color("lightgray"))
                                    .overlay(
                                        HStack{
                                            Text("All")
                                                .foregroundColor(.black)
                                                .padding()
                                            Spacer()
                                            Image(systemName: "chevron.down.circle.fill")
                                                .foregroundColor(.yellow)
                                                .font(Font.system(size: 18, weight: .bold, design: .default))
                                                .padding()
                                        }
                                    )
                            }
                            Spacer()
                        }
                    }
                    HStack {
                        VStack{
                            HStack{
                                Toggle(isOn: $smoking) {
                                    Image("smoking")
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                                Spacer()
                            }.padding()
                            HStack{
                                Toggle(isOn: $billiards) {
                                    Image("billiard")
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                                Spacer()
                            }.padding()
                        }
                        VStack{
                            HStack{
                                Toggle(isOn: $darts) {
                                    Image("darts")
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: .center)
                                }.toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                                Spacer()
                            }.padding()
                            HStack{
                                Toggle(isOn: $betting) {
                                    Image("betting")
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: .center)
                                }
                                .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                                Spacer()
                            }.padding()
                        }
                    }
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.yellow)
                        .frame(width: 300, height: 40, alignment: .center)
                        .shadow(color: .gray, radius: 10, x: 1, y: 2)
                        .overlay(
                            Text("Submit")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(Font.system(size: 25))
                        )
                }
            )
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
