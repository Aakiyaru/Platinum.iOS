//
//  TokenModel.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import Foundation
struct Token: Decodable, Hashable{
    var access_token: String
    var username: String
}
