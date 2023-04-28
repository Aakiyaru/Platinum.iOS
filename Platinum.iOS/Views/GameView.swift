import SwiftUI

struct GameView: View
{
    @EnvironmentObject var viewModel : ContentViewModel
    
    var body: some View
    {
        NavigationView
        {
            ZStack(alignment: .top)
            {
                VStack
                {
                    BannerView()
                        .padding(-10)
                    
                    HStack
                    {
                        AsyncImage(url: URL(string: viewModel.game.cover)) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 70, height: 100)
                            .background(Color.gray)
                        VStack
                        {
                            Text(viewModel.game.name)
                            Text(viewModel.game.developer)
                            Text(viewModel.game.publisher)
                            Text(viewModel.game.realease)
                        }
                    }
                    .padding()
                    
                    List
                    {
                        ForEach(viewModel.achivements, id: \.self)
                        {achivement in
                            NavigationLink(destination: AchivementView())
                            {
                                AchivementCardView(achivement: achivement)
                            }
                        }

                    }
                }
            }
            .onAppear
            {
                viewModel.GetGame()
                viewModel.GetAchivementList(gameId: viewModel.game.id)
            }
        }
    }
}
