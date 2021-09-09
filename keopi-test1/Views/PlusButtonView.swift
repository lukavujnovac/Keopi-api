//
//  PlusButtonView.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import SwiftUI

struct PlusButtonView: View {
    var body: some View {
        Button(action: {}, label: {
            Circle()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.yellow)
                .overlay(
                    Text("+")
                        .font(Font.system(size: 30))
                        .padding(.bottom, 4)
                        .foregroundColor(.white)          
                )
        }).animation(.easeIn) 
    }
}

struct PlusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButtonView()
    }
}
