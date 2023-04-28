//
//  Platinum_iOSApp.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import SwiftUI

@main
struct Platinum_iOSApp: App {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
