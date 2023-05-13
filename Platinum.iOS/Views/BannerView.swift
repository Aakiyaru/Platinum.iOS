import Foundation
import SwiftUI

struct BannerView: View{
    var body: some View{
        HStack{
            Image("logo")
                .resizable()
                .frame(width: 200, height: 50)
        }
        .frame(width: 400, height: 80)
        .background(Color("LogoBgColor"))
        .padding(0)
    }
}
