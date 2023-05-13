import Foundation

struct Game: Hashable, Codable{
    var id: Int
    var name: String
    var cover: String
    var developer: String
    var publisher: String
    var realease: String
}
