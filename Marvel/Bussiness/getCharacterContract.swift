

import Foundation

protocol CharacterRepositroyProtocol {
    
    func getCharactersData(name : String , completion : @escaping (([Result])->Void) )
    func getComicsData(url : String , completion : @escaping (([Comic])->Void) )
}

