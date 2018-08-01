import Foundation
import UIKit

class MarvelPresenter {
    var view : MarvelViewProtocol
    init(view : MarvelViewProtocol) {
        self.view = view
        self.view.adjustProgressView(withProgress: 0)
        getMarvelDataFromNetwork(name: "")
    }
    
    func getMarvelDataFromNetwork(name : String) {
        CharacterRepositoryUseCase.sharedInstance.getCharactersData(name: name, completion: {(charactersFromNetwork:[Result]) in
            var urls = [String]()
            for char in charactersFromNetwork {
                urls.append( "\(char.thumbnail.path).\(char.thumbnail.thumbnailExtension.rawValue)")
            }
            self.view.getCharacters(characters: charactersFromNetwork)
            self.view.adjustProgressView(withProgress: 0.1)
            self.getMarvelImagesFromNetwork(ImagesUrl: urls)
        }
        )
    }
    
    func getMarvelImagesFromNetwork(ImagesUrl :[String]) {
        var marvelCharactersImages = [UIImage?] (repeating : nil , count : ImagesUrl.count)
        var charCount = 0
        let remainingProgressRatio :Float = 0.9
        var currentProgressRation :Float = 0.1
        if(ImagesUrl.count>0) {
            for urlIdx in 0...ImagesUrl.count-1 {
                AlamofireClient.sharedInstance.getImage(withUrl:ImagesUrl[urlIdx] , success :  {(image:UIImage) in
                    marvelCharactersImages[urlIdx] = image // urlIdx is private variable here
                    DispatchQueue.global(qos: .utility).sync { //mutex lock
                        charCount += 1
                        currentProgressRation += remainingProgressRatio / Float(ImagesUrl.count)
                        DispatchQueue.main.async {
                            self.view.adjustProgressView(withProgress: currentProgressRation)
                        }
                    }
                    
                    if(charCount  == ImagesUrl.count) {
                        self.view.getImagesFromPresenter(images: marvelCharactersImages)
                        self.view.hideProgressBar()
                        self.view.initSearchBar()
                    }
                }, failure :  { (error :Error) in
                    print(error)
                })
            }
        } else {
            self.view.getImagesFromPresenter(images: marvelCharactersImages)
            self.view.hideProgressBar()
        }
    }
    
}
