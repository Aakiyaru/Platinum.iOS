import Foundation
import SwiftUI

struct CommentCardView: View{
    var comment: Comment
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Пользователь #\(comment.userId)")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .bold()
                Text(comment.text)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }
            
        }
    }
}

