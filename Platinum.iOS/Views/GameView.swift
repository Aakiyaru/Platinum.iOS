import SwiftUI

struct GameView: View
{
    @EnvironmentObject var viewModel : ContentViewModel
    var game: GameCard
    
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
                    AsyncImage(url: URL(string: viewModel.game.cover)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 130)
                        .background(Color.gray)
                    VStack (alignment: .leading)
                    {
                        Text(viewModel.game.name)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .foregroundColor(.white)
                        Text("Разработчик: " + viewModel.game.developer)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        Text("Издатель: " + viewModel.game.publisher)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                        Text("Релиз: " + viewModel.game.realease)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 400, height: 150)
                .background(Color("SearchBg"))
                .padding(.bottom, -10)
                
                List
                {
                    ForEach(viewModel.achivements, id: \.self)
                    {achivement in
                        NavigationLink(destination: AchivementView(achivement: achivement))
                        {
                            AchivementCardView(achivement: achivement)
                        }
                    }

                }
            }
        }
        .onAppear
        {
            viewModel.GetGame(ggame: game)
            viewModel.GetAchivementList(gameId: game.id)
        }
        .navigationTitle(Text(viewModel.game.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}
