//
//  DateList.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 13.09.2021..
//

import Foundation

struct DateList: Identifiable, Hashable, Codable {
    var id = UUID()
    var date: String
}
