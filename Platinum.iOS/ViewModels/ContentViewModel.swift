import Foundation

class ContentViewModel: ObservableObject{
    @Published var games : [Game] = []
    @Published var game: Game = Game(
        id: 0,
        name: "",
        cover: "",
        developer: "",
        publisher: "",
        realease: ""
    )
    @Published var achivements: [Achivement] = []
    @Published var achivement: Achivement = Achivement(
        id: 0,
        name: "",
        description: "",
        gameId: 0,
        icon: ""
    )
    @Published var comments: [Comment] = []
    @Published var comment: Comment = Comment(
        id: 0,
        userId: 0,
        achivementId: 0,
        text: ""
    )
    
    func GetGameList(){
        print("game list")
        games = []
        games.append(Game(id: 1,
                          name: "God of War",
                          cover: "https://cdn1.epicgames.com/offer/3ddd6a590da64e3686042d108968a6b2/EGS_GodofWar_SantaMonicaStudio_S2_1200x1600-fbdf3cbc2980749091d52751ffabb7b7_1200x1600-fbdf3cbc2980749091d52751ffabb7b7",
                          developer: "Santa Monica Studio",
                          publisher: "",
                          realease: ""))
        games.append(Game(id: 2,
                          name: "Red Dead Redemption 2",
                          cover: "https://avatars.mds.yandex.net/get-mpic/5235182/img_id6251776639395582946.jpeg/orig",
                          developer: "Rockstar Games",
                          publisher: "Rockstar Games",
                          realease: "21.11.2018"))
    }
    
    func FindGameList(){
        games = []
        games.append(Game(id: 2,
                          name: "Red Dead Redemption 2",
                          cover: "https://avatars.mds.yandex.net/get-mpic/5235182/img_id6251776639395582946.jpeg/orig",
                          developer: "Rockstar Games",
                          publisher: "",
                          realease: ""))
    }
    
    func GetGame(){
        print("game")
        game = games[1]
    }
    
    func GetAchivementList(gameId:Int){
        print("achivements list")
        achivements = []
        achivements.append(Achivement(id: 1, name: "Acw", description: "dawda", gameId: 1, icon: ""))
    }
    
    func GetAchivement(gameId:Int, id:Int){
        print("achivement")
        achivement = achivements[0]
    }
    
    func GetCommentsList(achivementId: Int){
        print("comments list")
    }
    
    func AddComment(userId: Int, text: String, AchivementId: Int){
        print("add comment")
    }
}
