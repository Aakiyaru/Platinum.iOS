import Foundation
import SwiftUI

struct AchivementView: View
{
    @EnvironmentObject var viewModel : ContentViewModel
    @Environment (\.presentationMode) var mode
    @State var commentText: String = ""
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
                    if (viewModel.comments == [])
                    {
                        Text("Подсказок нет")
                    }
                    else
                    {
                        ForEach(viewModel.comments, id: \.self)
                        {comment in
                            CommentCardView(comment: comment)
                        }
                    }
                }
                
                HStack
                {
                    TextField("asdawd", text:$commentText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    if !(commentText.isEmpty)
                    {
                        Button("send")
                        {
                            viewModel.AddComment(text: commentText, AchivementId: achivement.id)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                            {
                                viewModel.GetCommentsList(achivementId: achivement.id)
                            }
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20))
                        .frame(width: 100, height: 4)
                    }
                    
                }
                .background(Color("SearchBg"))
            }
        }
        .onAppear
        {
            viewModel.GetCommentsList(achivementId: achivement.id)
        }
        .onBackSwipe
        {
            mode.wrappedValue.dismiss()
        }
        .navigationBarHidden(true)
    }
}

struct AchivementView_Previews: PreviewProvider
{
    static var previews: some View
    {
        AchivementView(achivement: Achivement(id: 2, name: "", description: "", gameId: 1, icon: ""))
            .environmentObject(ContentViewModel())
    }
}

