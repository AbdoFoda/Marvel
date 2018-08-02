//
//  DetailsPresenter.swift
//  Marvel
//
//  Created by Abdulrahman on 8/1/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
import UIKit
class DetailsPresenter {
    var view : DetailsViewProtocol?
    
    init (view : DetailsViewProtocol) {
        self.view = view
        getCharacterComics()
    }
    
    
    func getCharacterComics() {
        let comicsUrl = "\(self.view!.getComicsURL())?\(APIURLS.API_Parameters)"
        
        RemoteDS.getComics(url: comicsUrl, onSuccess: { (comics) in 
            self.view?.loadComics(comics: comics)
            self.getComicsImages(comics: comics)
          
        }) { (error) in
            print (error)
        }
    }
    
    func getComicsImages(comics :[Comic]) {
        for idxComic in 0..<comics.count{
            let url = "\(comics[idxComic].thumbnail.path).\(comics[idxComic].thumbnail.thumbnailExtension.rawValue)"
            AlamofireClient.sharedInstance.getImage(withUrl: url, success: { (image) in
                    self.view?.loadComicImage(withIdx: idxComic, image: image)
            }) { (error) in
                print(error)
            }
        }
    }
    
    
    
}
