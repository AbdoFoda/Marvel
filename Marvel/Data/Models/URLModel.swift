//
//  URLModel.swift
//  Marvel
//
//  Created by Abdulrahman on 8/6/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation

struct URL: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
