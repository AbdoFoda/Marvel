

import Foundation

protocol CharacterRepositroyProtocol {
    
    func getCharactersData(name : String , completion : @escaping (([Result])->Void) )
    
}

