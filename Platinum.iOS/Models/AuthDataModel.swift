//
//  AuthDataModel.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import Foundation
struct AuthData: Decodable, Hashable{
    var login: String
    var password: String
}
