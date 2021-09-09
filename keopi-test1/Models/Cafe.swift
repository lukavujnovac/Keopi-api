//
//  Cafe.swift
//  keopi-test1
//
//  Created by Luka Vujnovac on 02.09.2021..
//

import Foundation

struct Cafe: Hashable, Codable {
    var id: String
    let address: String
    let billiards: Bool
    let bio: String
    let cityId: String
    let name: String
    let capacity: String
    let betting: Bool
    let latitude: Float
    let longitude: Float
    let areaId: String
    let location: String
    let music: String
    let dart: Bool
    let startingWorkTime: Int
    let age: String
    let smoking: Bool
    let picture: String
    let endingWorkTime: Int
    let terrace: Bool
    let hookah: Bool
    let playground: Bool
    let instagram: String
    let facebook: String
}

struct CafeListModel: Hashable, Codable {
    let cafes: [Cafe]
    let currentPage: Int
    let totalPages: Int
    let pageSize: Int
    let hasPrevious: Bool
    let hasNext: Bool
}
