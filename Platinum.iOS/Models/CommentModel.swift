//
//  CommentModel.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import Foundation
struct Comment: Hashable{
    var id: Int
    var userId: Int
    var achivementId: Int
    var text: String
}
