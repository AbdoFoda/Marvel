//
//  RemoteDataSource.swift
//  Marvel
//
//  Created by Ahmad Ragab on 7/24/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import Foundation
import Cache
class RemoteDS  :MarvelDataSource{
    
    
    static func getMarvelData(name: String, onSuccess_repo: @escaping ([Result]) -> Void, onFailure_repo: @escaping (String) -> Void) {
        var url = APIURLS.characterURL + APIURLS.API_Parameters
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
                // caching goes here :
                if let marvelStorage = try? Storage(diskConfig: DiskConfig(name: "Floppy"),memoryConfig: MemoryConfig(),transformer: TransformerFactory.forData())  {
                    marvelStorage.transformCodable(ofType: DataClass.self).async.setObject((ret?.data)!, forKey: name, completion: { result in
                        if case .value(let data) = result {
                            print(data)
                        }
                    })
                    
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
    
    static func getComics(url : String ,  onSuccess : @escaping ([Comic])->Void , onFailure: @escaping (Error)->Void ){
        AlamofireClient.sharedInstance.executeGetRequest(url: url, parameters: [:], header: [:], success: { (response) in
            let ret = try? JSONDecoder().decode(ComicsResponse.self, from: response)
            if let comics = ret?.data.results{
                onSuccess(comics)
            }
        }) { (error) in
            print(error)
        }
    }
    
    
}
