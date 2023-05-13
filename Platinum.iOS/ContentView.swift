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
    
    var body: some View
    {
        if(screenStatement == "auth")
        {
            NavigationView
            {
                ZStack(alignment: .top)
                {
                    Color("LogoBgColor")
                        .ignoresSafeArea()
                    VStack
                    {
                        BannerView()
                            .padding(-10)
                        
                        HStack
                        {
                            Text("Авторизация")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 400, height: 70)
                        .background(Color("SearchBg"))
                        .foregroundColor(.white)
                        
                        Form
                        {
                            Section(header: Text("Login"))
                            {
                                TextField("login", text:$login)
                            }
                            Section(header: Text("Password"))
                            {
                                SecureField("password", text:$pass)
                            }
                        }
                        .padding(.top, -10)
                        .frame(height: 525)
                        HStack
                        {
                            Button("Войти")
                            {
                                //TODO: - do
                                
                                showMsg = true
                            }
                            .alert("Success", isPresented: $showMsg)
                            {
                                Button("OK", role:.cancel){
                                    screenStatement="main"
                                    showMsg = false
                                }
                            }
                            .foregroundColor(.white)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 120, height: 50)
                                    .foregroundColor(Color("SearchBg"))
                            }
                            .frame(width: 120, height: 50)
                            
                            Spacer()
                                .frame(width: 80)
                            
                            Button("Регистрация")
                            {
                                screenStatement = "reg"
                            }
                            .frame(width: 120, height: 50)
                            .foregroundColor(.white)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 120, height: 50)
                                    .foregroundColor(Color("SearchBg"))
                            }
                        }
                        .padding()
                    }
                }
                .environmentObject(viewModel)
            }
            .onAppear
            {
                viewModel.CheckAuth()
            }
        }
        else if (screenStatement == "reg")
        {
            NavigationView
            {
                ZStack(alignment: .top)
                {
                    Color("LogoBgColor")
                        .ignoresSafeArea()
                    VStack
                    {
                        BannerView()
                            .padding(-10)
                        
                        HStack
                        {
                            Text("Регистрация")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        .frame(width: 400, height: 70)
                        .background(Color("SearchBg"))
                        .foregroundColor(.white)
                        
                        Form
                        {
                            Section(header: Text("Login"))
                            {
                                TextField("login", text:$login)
                            }
                            Section(header: Text("Username"))
                            {
                                TextField("username", text:$username)
                            }
                            Section(header: Text("Password"))
                            {
                                SecureField("password", text:$pass)
                            }
                        }
                        .padding(.top, -10)
                        .frame(height: 525)
                        HStack
                        {
                            Button("Регистрация")
                            {
                                //TODO: - регистрация
                                
                                showMsg = true
                            }
                            .alert("Success", isPresented: $showMsg){
                                Button("OK", role: .cancel){
                                    showMsg = false
                                    screenStatement = "auth"
                                }
                            }
                            .foregroundColor(.white)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 120, height: 50)
                                    .foregroundColor(Color("SearchBg"))
                            }
                            .frame(width: 120, height: 50)
                            
                            Spacer()
                                .frame(width: 80)
                            
                            Button("Назад")
                            {
                                screenStatement = "auth"
                            }
                            .frame(width: 120, height: 50)
                            .foregroundColor(.white)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 120, height: 50)
                                    .foregroundColor(Color("SearchBg"))
                            }
                        }
                        .padding()
                    }
                }
                .environmentObject(viewModel)
            }
        }
        else if (screenStatement == "main")
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
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
