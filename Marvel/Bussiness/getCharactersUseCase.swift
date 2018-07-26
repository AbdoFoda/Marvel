import Foundation

class CharacterRepositoryUseCase  :CharacterRepositroyProtocol{
    func getCharactersData(completion: @escaping (([Result]) -> Void)) {
        
        RemoteDS.getMarvelData(requestValues: CharacterRequestValues(), onSuccess_repo: { response in
            
            completion(response)
        }) { (error) in
            
            print(error)
        }
    }
    
    
}


