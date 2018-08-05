import Foundation

class CharacterRepositoryUseCase  :CharacterRepositroyProtocol{
   
  
    static var sharedInstance = CharacterRepositoryUseCase()
    
    func getCharactersData(name: String, completion: @escaping (([Result]) -> Void)) {
        MarvelRepository.getMarvelData(name: name, onSuccess_repo: { response in
            completion(response)
        }) { (error) in
            
            print(error)
        }
    }
    
    
    
    func getComicsData(url: String, completion: @escaping (([Comic]) -> Void)) {
        
        RemoteDS.getComics(url: url, onSuccess: { (comics) in
            completion(comics)
        }) { (error) in
            print(error)
        }
    }
    
   
    
    
    
    
    
  
    
    
    
    
    
}


