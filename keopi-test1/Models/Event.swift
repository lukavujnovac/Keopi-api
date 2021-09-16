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

class TestData {
    static let events = [
        Event(id: "123", cafeBarId: "1234", date: "08.09.2021.", description: "lsdkhfjosdjfo", performer: "Jole", price: "30kn", type: 1),
        Event(id: "111", cafeBarId: "1111", date: "09.09.2021.", description: "kjsdhgksdhj", performer: "Baka Prase", price: "50kn", type: 2)
    ]
}
