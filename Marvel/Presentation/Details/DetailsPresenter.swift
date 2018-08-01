//
//  DetailsPresenter.swift
//  Marvel
//
//  Created by Abdulrahman on 8/1/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
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
        }) { (error) in
            print (error)
        }
        
    }
    
}
