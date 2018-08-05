//
//  DataSourceContract.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation

protocol MarvelDataSource{
    
    
   static func getMarvelData(name  : String,  onSuccess_repo:@escaping([Result]) -> Void, onFailure_repo:@escaping (String) -> Void);
    
    
}
