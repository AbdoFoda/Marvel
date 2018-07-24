//
//  MarvelCell.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

class MarvelCell: UITableViewCell {

    @IBOutlet weak var MarvleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var MarvelDescription: UILabel!
    @IBOutlet weak var MarvelName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
