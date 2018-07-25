//
//  DataSourceContract.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation

protocol MarvelDataSource{
    
    
   func getMarvelData(requestValues: CharacterRequestValues,  onSuccess_repo:@escaping([Marvel]) -> Void, onFailure_repo:@escaping (String) -> Void);
    
    ////// returning a dictionary including CallCenterScreen data
    
    
}
