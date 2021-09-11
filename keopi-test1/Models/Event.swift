//
//  Event.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 11.09.2021..
//

import Foundation

struct Event: Hashable, Codable{
    var id: String
    var cafeBarId: String
    var date: String
    var description: String
    var performer: String
    var price: String
    var type: Int
}
