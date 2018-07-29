//
//  ImageViewExtension.swift
//  Marvel
//
//  Created by Abdulrahman on 7/26/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
import UIKit
// extension just to add an url to image and to be loaded automatic :)
extension UIImageView{
    func updateImage(withUrl  url:String ) {
        print(url)
        AlamofireClient.sharedInstance.getImage(withUrl: url,
        success: { (image) in
            DispatchQueue.main.async {
                 self.image = image
            }
           
        }) { (error) in
            print(error)
        }
    }
}


