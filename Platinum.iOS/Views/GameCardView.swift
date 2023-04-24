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
        Text(viewModel.games[0].name)
    }
}
