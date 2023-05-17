import SwiftUI

struct ContentView: View
{
    @EnvironmentObject var viewModel: ContentViewModel
    
    @State var login: String = ""
    @State var pass: String = ""
    @State var username: String = ""
    @State var screenStatement = "auth"
    @State var search: String = ""
    @State private var showMsg: Bool = false
    @FocusState var isFoc: Bool
    
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
                        TextField("Поиск", text:$search, onEditingChanged: {changed in
                            if(changed)
                            {
                                viewModel.GetGameList()
                            }
                        })
                        .focused($isFoc)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Найти")
                        {
                            viewModel.FindGameList(searchString: search)
                            isFoc = false
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
