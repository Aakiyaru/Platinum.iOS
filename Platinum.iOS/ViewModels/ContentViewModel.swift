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
        games.append(Game(id: 1, name: "GoW", cover: "", developer: "", publisher: "", realease: ""))
    }
    
    func GetGame(){
        print("game")
    }
    
    func GetAchivementList(gameId:Int){
        print("achivements list")
    }
    
    func GetAchivement(gameId:Int, id:Int){
        print("achivement")
    }
    
    func GetCommentsList(achivementId: Int){
        print("comments list")
    }
    
    func AddComment(userId: Int, text: String, AchivementId: Int){
        print("add comment")
    }
}
