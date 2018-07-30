import Foundation

class CharacterRepositoryUseCase  :CharacterRepositroyProtocol{
    
    static var sharedInstance = CharacterRepositoryUseCase()
    func getCharactersData(name : String ,completion: @escaping (([Result]) -> Void)) {
        
        RemoteDS.getMarvelData(name: name, onSuccess_repo: { response in
            
            completion(response)
        }) { (error) in
            
            print(error)
        }
    }
    
    
}


