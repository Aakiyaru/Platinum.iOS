//
//  Achivement.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import Foundation
struct Achivement: Decodable, Hashable{
    var id: Int
    var name: String
    var description: String
    var gameId: Int
    var icon: String
}
