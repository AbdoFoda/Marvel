import Foundation
import SwiftHash

struct APIURLS {
    static let characterURL = "http://gateway.marvel.com/v1/public/characters?"
    static let publicKey = "8f22f0ef523fdb5c593d6a01c0c5e4ba"
    static let privateKey = "4c33a28df0f6d367b2af98800d75c2809dbda282"
    static let ts = "1"
    static func hash() ->String  {
        return "d33dab3c2be21242fffac916c4897965"
    }
    static let characterParameters = "ts=\(ts)&apikey=\(publicKey)&hash=\(hash())"
}


//struct CharacterRequestValues {
//    init(name:String) {
//        self.name = name
//    }
//    var name:String?
//    var nameStartWith:String?
//    var modifiedSince:Date?
//    var comics:[Int]?
//    var series:[Int]?
//    var events:[Int]?
//    var stories:[Int]?
//    enum CompareParameter :String{
//        case name , modified
//    }
//    var OrderBy : CompareParameter?
//    var limit : Int?
//    var offset :Int?
//}

