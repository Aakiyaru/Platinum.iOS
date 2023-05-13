import SwiftUI

struct ContentView: View
{
    @State var search: String = ""
    @EnvironmentObject var viewModel: ContentViewModel
    
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
                        TextField("Поиск", text:$search)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Найти")
                        {
                            viewModel.FindGameList(searchString: search)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 20))
                        .frame(width: 100, height: 4)
                    }
                    .background(Color("SearchBg"))
                    .padding(.bottom, -10.0)
                    
                    List
                    {
                        ForEach(viewModel.games, id: \.self)
                        {game in
                            
                            NavigationLink(destination: GameView(game: game))
                            {
                                GameCardView(game: game)
                            }
                        }
                    }
                }
            }
            .environmentObject(viewModel)
            .onAppear
            {
                viewModel.GetGameList()
            }
        }
        .navigationTitle(Text("Главная"))
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
