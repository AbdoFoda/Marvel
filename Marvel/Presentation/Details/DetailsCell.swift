//
//  DetailsCell.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/31/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell{
    
    var comics = [Comic]()
    var series = [Comic]()
    
    var comicsImages = [UIImage?] ()
    var seriesImages = [UIImage?] ()
    
    let cellWidth = 100
    let cellHeight = 150
   
    @IBOutlet weak var detailsCollectionView: UICollectionView!

    override func awakeFromNib() {
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
    }
    func setComics (comics : [Comic]) {
        self.comics = comics
        comicsImages = [UIImage?] (repeating: nil, count: comics.count)
        detailsCollectionView.reloadData()
    }
    
    func loadComicImage(atIndex idx : Int , withImage image : UIImage) {
        let indexPath = IndexPath(row: idx, section: 0)
        comicsImages[idx] = image
        detailsCollectionView.reloadItems(at: [indexPath])
    }
    
    func setSeries (series : [Comic]) {
        self.series = series
        seriesImages = [UIImage?] (repeating: nil, count: series.count)
        detailsCollectionView.reloadData()
    }
    
    func loadSeriesImage(atIndex idx : Int , withImage image : UIImage) {
        let indexPath = IndexPath(row: idx, section: 0)
        seriesImages[idx] = image
        detailsCollectionView.reloadItems(at: [indexPath])
    }
}

extension DetailsCell : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return max(comics.count, series.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollection", for: indexPath) as! DetailsCollectionViewCell
        
        if(comics.count != 0) {
            cell.detailsName.text =  (comics[indexPath.row]).title
            if (comicsImages[indexPath.row]) != nil {
                cell.detailsImage.image = comicsImages[indexPath.row]
            }
        }else if(series.count != 0){
            cell.detailsName.text =  (series[indexPath.row]).title
            if (seriesImages[indexPath.row]) != nil {
                cell.detailsImage.image = seriesImages[indexPath.row]
            }
        }
        return cell
        
    }
    
}
