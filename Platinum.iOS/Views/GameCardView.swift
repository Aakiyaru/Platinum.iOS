//
//  GameCardView.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import Foundation
import SwiftUI

struct GameCardView: View{
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: "https://cdn1.epicgames.com/offer/3ddd6a590da64e3686042d108968a6b2/EGS_GodofWar_SantaMonicaStudio_S2_1200x1600-fbdf3cbc2980749091d52751ffabb7b7_1200x1600-fbdf3cbc2980749091d52751ffabb7b7")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 70, height: 100)
                .background(Color.gray)
            
            VStack(alignment: .leading){
                Text("God of War (2018)")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .bold()
                Text("Santa Monica Studio")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
