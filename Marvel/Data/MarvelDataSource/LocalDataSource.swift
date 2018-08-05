//
//  LocalDataSource.swift
//  Marvel
//
//  Created by Abdulrahman on 8/1/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
import Cache

class LocalDataSource : MarvelDataSource {
    
    static var storage = try?Storage(diskConfig: DiskConfig(name: "Floppy"),memoryConfig: MemoryConfig(),transformer: TransformerFactory.forData())
    
    static func getMarvelData(name: String, onSuccess_repo: @escaping ([Result]) -> Void, onFailure_repo: @escaping (String) -> Void) {
        
        if let entry = try? storage?.transformCodable(ofType: DataClass.self).entry(forKey: name){
            print("Cached response")
            onSuccess_repo((entry?.object.results)! )
        }else{
            onFailure_repo("Data not found in cache")
        }
    }
    
    
}
