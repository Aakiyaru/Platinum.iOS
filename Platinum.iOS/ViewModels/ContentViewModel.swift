//MARK: - ViewModel приложения, в котором расположены методы для работы с данными

import Foundation
import Alamofire

class ContentViewModel: ObservableObject
{
    //массив игр
    @Published var games : [GameCard] = []
    //одна конкретная игра
    @Published var game: Game = Game(
        id: 0,
        name: "",
        cover: "",
        developer: "",
        publisher: "",
        realease: ""
    )
    //массив достижений
    @Published var achivements: [Achivement] = []
    //массив комментариев
    @Published var comments: [Comment] = []
    //один конкретный комментарий
    @Published var comment: Comment = Comment(
        id: 0,
        userId: 0,
        achivementId: 0,
        text: ""
    )
    @Published var userId: Int = Int.random(in: 1...1000)
    
    //функция, которая получает список игр с сервера
    func GetGameList()
    {
        print("game list")
        games = []
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/games")
            .responseDecodable(of: [GameCard].self) {response in
                if response.value != nil
                {
                    self.games = response.value!
                }
            }
    }
    
    //получает список игр, совпадающих со строкой поиска
    func FindGameList(searchString: String)
    {
        games = []
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/games/search",
                     method: .get,
                     parameters: ["searchString" : searchString])
            .responseDecodable(of: [GameCard].self) {response in
                if response.value != nil
                {
                    self.games = response.value!
                }
            }
    }
    
    //получает расширенные данные о конкретной игре
    func GetGame(ggame: GameCard)
    {
        print("game")
        
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/games/\(ggame.id)",
                     method: .get)
            .responseDecodable(of: Game.self) {response in
                if response.value != nil
                {
                    self.game = response.value!
                }
            }
    }
    
    //получает список достижений по игре
    func GetAchivementList(gameId:Int)
    {
        print("achivements list")
        achivements = []
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/achivements",
                     method: .get,
                     parameters: ["gameId":gameId])
            .responseDecodable(of: [Achivement].self) {response in
                if response.value != nil
                {
                    self.achivements = response.value!
                }
            }
        
    }
    
    //получает список комментариев по достижению
    func GetCommentsList(achivementId: Int)
    {
        print("comments list")
        comments = []
        
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/comments",
                     method: .get,
                     parameters: ["achivementId":achivementId])
            .responseDecodable(of: [Comment].self) {response in
                if response.value != nil
                {
                    self.comments = response.value!
                }
            }
    }
    
    //отправляет введённый комментарий на сервер
    //TODO: - сделать ввод комментариев
    func AddComment(text: String, AchivementId: Int)
    {
        AF
            .request("http://aakiyaru23-001-site1.atempurl.com/comments",
                     method: .post,
                     parameters: ["userId" : self.userId,
                                  "text" : text,
                                  "AchivementId" : AchivementId],
                     encoding: JSONEncoding.default)
            .response {response in
                
            }
    }
}
