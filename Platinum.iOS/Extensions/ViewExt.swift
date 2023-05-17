//MARK: - Extension, который добавляет возможность перемещаться назад по навигации с помощью свайпа, вместо кнопки

import Foundation
import SwiftUI

extension View
{
    func onBackSwipe(perform action: @escaping () -> Void) -> some View
    {
        gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80
                    {
                        action()
                    }
                })
        )
    }
}
