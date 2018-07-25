//
//  RemoteDataSource.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
class RemoteDS  :MarvelDataSource{
    
    
    static func getMarvelData(requestValues: CharacterRequestValues, onSuccess_repo: @escaping ([Result]) -> Void, onFailure_repo: @escaping (String) -> Void) {
        let url = APIURLS.characterURL
        var headers: [String : String] = [:]
        headers["Content-type"] = "application/json"
        
        AlamofireClient.sharedInstance.executeGetRequest(url: url, parameters: [:], header: headers, success: { (response) in
            print("DONWLOADED")
            let json = response as! NSDictionary
            let data  = json.object(forKey: "data") as! [String:Any]
            let characters :[Result] = data["results"] as! [Result]
            for char in characters{
                print(char.name)
            }
            
            
        }
           , failure: {
                (error) in
                print(error)
        }
        )
    }
    
    
}
