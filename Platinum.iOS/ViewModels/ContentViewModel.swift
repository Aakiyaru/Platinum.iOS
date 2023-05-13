import Foundation
import Alamofire

class ContentViewModel: ObservableObject
{
    @Published var games : [GameCard] = []
    @Published var game: Game = Game(
        id: 0,
        name: "",
        cover: "",
        developer: "",
        publisher: "",
        realease: ""
    )
    @Published var achivements: [Achivement] = []
    @Published var comments: [Comment] = []
    @Published var comment: Comment = Comment(
        id: 0,
        userId: 0,
        achivementId: 0,
        text: ""
    )
    @Published var userName: String = ""
    
    func GetGameList(){
        print("game list")
        games = []
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/games")
            .responseDecodable(of: [GameCard].self) {response in
                if response.value != nil{
                    self.games = response.value!
                }
            }
    }
    
    func FindGameList(searchString: String){
        games = []
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/games/search?searchString=\(searchString)")
            .responseDecodable(of: [GameCard].self) {response in
                if response.value != nil{
                    self.games = response.value!
                }
            }
    }
    
    func GetGame(ggame: GameCard){
        print("game")
        
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/games/\(ggame.id)")
            .responseDecodable(of: Game.self) {response in
                if response.value != nil{
                    self.game = response.value!
                }
            }
    }
    
    func GetAchivementList(gameId:Int){
        print("achivements list")
        achivements = []
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/achivements?gameid=\(gameId)")
            .responseDecodable(of: [Achivement].self) {response in
                if response.value != nil{
                    self.achivements = response.value!
                }
            }
        
    }
    
    func GetCommentsList(achivementId: Int){
        print("comments list")
        comments = []
        
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/comments?achivementId=\(achivementId)")
            .responseDecodable(of: [Comment].self) {response in
                if response.value != nil{
                    self.comments = response.value!
                }
            }
    }
    
    func AddComment(userId: Int, text: String, AchivementId: Int){
        print("add comment")
    }
}
