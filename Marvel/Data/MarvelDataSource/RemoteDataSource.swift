//
//  RemoteDataSource.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
class RemoteDS  :MarvelDataSource{
    
    
    static func getMarvelData(name: String, onSuccess_repo: @escaping ([Result]) -> Void, onFailure_repo: @escaping (String) -> Void) {
        var url = APIURLS.characterURL + APIURLS.characterParameters
        if name != ""{
           url += "&nameStartsWith=\(name)"
        }
        AlamofireClient.sharedInstance.executeGetRequest(url: url, parameters: [:], header: [:], success: { (response) in
            print("DONWLOADED")
            let ret = try? JSONDecoder().decode(Marvel.self, from : response)
            if let characters = ret?.data.results {
                for char in characters{
                    print(char.name)
                }
                onSuccess_repo(characters)
            }
            }
           , failure: {
                (error) in
                print(error)
        }
        )
    }
    
    
}
