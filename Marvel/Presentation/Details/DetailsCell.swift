//
//  DetailsCell.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/31/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource {
    
    var comics :[Comic]?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (comics?.count)!
    }
    let cellWidth = 100
    let cellHeight = 150
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func setComics (comics : [Comic]) {
            self.comics = comics
            detailsCollectionView.delegate = self
            detailsCollectionView.dataSource = self
            detailsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollection", for: indexPath) as! DetailsCollectionViewCell
        cell.detailsName.text =  (comics![indexPath.row]).title
        return cell
        
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
   
    }
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
