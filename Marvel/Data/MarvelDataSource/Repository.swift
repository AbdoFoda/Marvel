//
//  DataSource.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation

class MarvelRepository : MarvelDataSource {
    
    static func getMarvelData(name: String, onSuccess_repo: @escaping ([Result]) -> Void, onFailure_repo: @escaping (String) -> Void) {
        LocalDataSource.getMarvelData(name: name, onSuccess_repo: { (characters) in
            onSuccess_repo(characters)
        }) { (error) in
            print(error)
            RemoteDS.getMarvelData(name: name, onSuccess_repo: { (characters) in
                onSuccess_repo(characters)
            }, onFailure_repo: { (error) in
                print(error)
            })
        }
    }
    
    
}
