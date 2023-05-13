import Foundation
import SwiftUI

struct AchivementView: View
{
    @EnvironmentObject var viewModel : ContentViewModel
    var achivement: Achivement
    
    var body: some View
    {
        ZStack(alignment: .top)
        {
            VStack
            {
                BannerView()
                    .padding(-10)
                
                HStack (alignment: .top)
                {
                    AsyncImage(url: URL(string: achivement.icon)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                    VStack (alignment: .leading)
                    {
                        Text(achivement.name)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Text(achivement.description)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 400, height: 150)
                .background(Color("SearchBg"))
                .padding(.bottom, -10)
                
                List
                {
                    ForEach(viewModel.comments, id: \.self)
                    {comment in
                        CommentCardView(comment: comment)
                    }

                }
            }
        }
        .onAppear
        {
            viewModel.GetCommentsList(achivementId: achivement.id)
        }
    }
}
