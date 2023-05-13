//
//  GameCard.swift
//  Platinum.iOS
//
//  Created by User on 13.05.2023.
//

import Foundation

struct GameCard: Decodable, Hashable{
    var id: Int
    var name: String
    var cover: String
}
