//
//  ComicsURIModel.swift
//  Marvel
//
//  Created by Abdulrahman on 8/6/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation


struct ComicsURI: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

struct ComicsItem: Codable {
    let resourceURI, name: String
}




