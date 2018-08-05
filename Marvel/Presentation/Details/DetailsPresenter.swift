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
    var loaded = false
    init (view : DetailsViewProtocol) {
        self.view = view
        self.view?.startActivityIndicator()
        getCharacterComics()
        getCharacterSeries()
    }
    
    func stopViewIndicator() {
        DispatchQueue.global().sync {
            if(self.loaded) {
                self.view?.stopActivityIndicator()
            }else{
                self.loaded = true
            }
        }
    }
    
    func getCharacterSeries() {
        let seriesUrl = "\(self.view!.getSeriesURL())?\(APIURLS.API_Parameters)"
        
        RemoteDS.getComics(url: seriesUrl, onSuccess: { (series) in
            self.view?.loadSeries(series: series)
            self.getComicsImages(comics: series) {
                (idx , image) in
                self.view?.loadSeriesImage(withIdx: idx, image: image)
                self.stopViewIndicator()
            }
        }) { (error) in
            print (error)
        }
    }
    
    
    func getCharacterComics() {
        let comicsUrl = "\(self.view!.getComicsURL())?\(APIURLS.API_Parameters)"
        
        RemoteDS.getComics(url: comicsUrl, onSuccess: { (comics) in 
            self.view?.loadComics(comics: comics)
            self.getComicsImages(comics: comics) {
                (idx , image) in
                    self.view?.loadComicImage(withIdx: idx, image: image)
                    self.stopViewIndicator()
            }
        }) { (error) in
            print (error)
        }
    }
    
    func getComicsImages(comics :[Comic] , completion : @escaping (Int,UIImage)->Void ){
        for idxComic in 0..<comics.count{
            let url = "\(comics[idxComic].thumbnail.path).\(comics[idxComic].thumbnail.thumbnailExtension.rawValue)"
            AlamofireClient.sharedInstance.getImage(withUrl: url, success: { (image) in
                    completion( idxComic,  image)
            }) { (error) in
                print(error)
            }
        }
    }
}
