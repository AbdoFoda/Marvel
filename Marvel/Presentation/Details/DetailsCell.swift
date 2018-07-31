//
//  DetailsCell.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/31/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        // Initialization code
    }
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
