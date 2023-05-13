//
//  ViewExt.swift
//  Platinum.iOS
//
//  Created by User on 13.05.2023.
//

import Foundation
import SwiftUI

extension View {
    func onBackSwipe(perform action: @escaping () -> Void) -> some View {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        action()
                    }
                })
        )
    }
}
