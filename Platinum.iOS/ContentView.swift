import SwiftUI

struct ContentView: View {
    @State var search: String = ""
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack(alignment: .top){
            Color("LogoBgColor")
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 50)
                }
                .frame(width: 400, height: 100)
                .background(Color("LogoBgColor"))
                .ignoresSafeArea()
                
                
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
                
                NavigationLink(destination: View2())
                {
                    GameCardView()
                }
            }
            .background(Color("BgColor"))
            .padding()
        }
        
    }
}

struct View2: View{
    var body: some View{
        Text("God of War")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
