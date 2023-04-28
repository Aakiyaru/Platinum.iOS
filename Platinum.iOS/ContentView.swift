import SwiftUI

struct ContentView: View {
    @State var search: String = ""
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            Color("LogoBgColor")
                .ignoresSafeArea()
            
            VStack{
                BannerView()
                HStack{
                    TextField("Поиск", text:$search)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Найти"){
                        viewModel.FindGameList()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 100, height: 4)
                }
                
                GameCardView(game: viewModel.games[0])
            }
            .background(Color("BgColor"))
            .padding()
        }
        .environmentObject(viewModel)
        .onAppear{
            viewModel.GetGameList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
