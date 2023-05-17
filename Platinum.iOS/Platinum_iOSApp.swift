import SwiftUI

@main
struct Platinum_iOSApp: App {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel) //ViewModel как EnvironmentObject для передачи данных между экранами
        }
    }
}
