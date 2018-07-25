//
//  RemoteDataSource.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
class RemoteDS  :MarvelDataSource{
    func getMarvelData(requestValues: CharacterRequestValues, onSuccess_repo: @escaping ([Marvel]) -> Void, onFailure_repo: @escaping (String) -> Void) {
        let url = APIURLS.characterURL
        var headers: [String : String] = [:]
        headers["Content-type"] = "application/json"
        
        AlamofireClient.sharedInstance.executeGetRequest(url: url, parameters: [:], header: headers, success: { (response) in
          //  let json  = response as! JSON
            
        }) { (error) in
            
        }
    }
    
    
}
