//
//  GameCardView.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import Foundation
import SwiftUI

struct GameCardView: View{
    var game: Game
    
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: game.cover)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 70, height: 100)
                .background(Color.gray)
            
            VStack(alignment: .leading){
                Text(game.name)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .bold()
                Text(game.developer)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
