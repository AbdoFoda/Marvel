//
//  DetailsCell.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/31/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell{
    
    var comics :[Comic]?
    var comicsImages = [UIImage?] ()
    let cellWidth = 100
    let cellHeight = 150
   
    @IBOutlet weak var detailsCollectionView: UICollectionView!

    func setComics (comics : [Comic]) {
        self.comics = comics
        comicsImages = [UIImage?] (repeating: nil, count: comics.count)
        print("Comic Images :")
        print(comics.count)
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        detailsCollectionView.reloadData()
    }
    
    func loadComicImage(atIndex idx : Int , withImage image : UIImage) {
        let indexPath = IndexPath(row: idx, section: 0)
        comicsImages[idx] = image
        detailsCollectionView.reloadItems(at: [indexPath])
    }
}

extension DetailsCell : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (comics?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollection", for: indexPath) as! DetailsCollectionViewCell
        cell.detailsName.text =  (comics![indexPath.row]).title
        cell.detailsName.adjustsFontSizeToFitWidth = true
        if (comicsImages[indexPath.row]) != nil {
            cell.detailsImage.image = comicsImages[indexPath.row]
        }
        return cell
        
    }
    
}
