//
//  AchivementCardView.swift
//  Platinum.iOS
//
//  Created by User on 28.04.2023.
//

import Foundation
import SwiftUI

struct AchivementCardView: View{
    var achivement: Achivement
    
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: achivement.icon)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading){
                Text(achivement.name)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .bold()
                Text(achivement.description)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            
        }
    }
}
