import Foundation
import UIKit
class MarvelPresenter {
    var view : MarvelViewProtocol
    init(view : MarvelViewProtocol) {
        self.view = view
        getMarvelDataFromNetwork()
    }
    
    func getMarvelDataFromNetwork() {
        CharacterRepositoryUseCase.sharedInstance.getCharactersData(completion: {(charactersFromNetwork:[Result]) in
            var urls = [String]()
            for char in charactersFromNetwork {
                urls.append( "\(char.thumbnail.path).\(char.thumbnail.thumbnailExtension.rawValue)")
            }
            self.getMarvelImagesFromNetwork(ImagesUrl: urls)
            self.view.getCharacters(characters: charactersFromNetwork)
        }
        )
    }
    
    func getMarvelImagesFromNetwork(ImagesUrl :[String]) {
        var marvelCharactersImages = [UIImage?] (repeating : nil , count : ImagesUrl.count)
        var charCount = 0
        for urlIdx in 0...ImagesUrl.count-1 {
            AlamofireClient.sharedInstance.getImage(withUrl:ImagesUrl[urlIdx] , success :  {(image:UIImage) in
                marvelCharactersImages[urlIdx] = image // urlIdx is private variable here
                DispatchQueue.global().sync { //mutex lock
                    charCount += 1
                }
                if(charCount  == ImagesUrl.count) {
                    self.view.getImagesFromPresenter(images: marvelCharactersImages)
                }
            }, failure :  { (error :Error) in
                print(error)
            })
        }
    }
    
}
