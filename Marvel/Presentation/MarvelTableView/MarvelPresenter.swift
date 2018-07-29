//
//  MarvelPresenter.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/29/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

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
        var marvelCharactersImages = [UIImage] ()
        for url in ImagesUrl {
            AlamofireClient.sharedInstance.getImage(withUrl:url , success :  {(image:UIImage) in
                marvelCharactersImages.append(image)
                if(marvelCharactersImages.count == ImagesUrl.count) {
                    self.view.getImagesFromPresenter(images: marvelCharactersImages)
                }
            }, failure :  { (error :Error) in
                print(error)
                
            }
            )
        }
        
    }
    
    
    
    
}
