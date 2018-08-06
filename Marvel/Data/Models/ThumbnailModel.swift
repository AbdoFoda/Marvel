//
//  ThumbnailModel.swift
//  Marvel
//
//  Created by Abdulrahman on 8/6/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}
