//
//  RequestManager.swift
//  RMS
//
//  Created by Marian on 12/19/16.
//  Copyright © 2016 mohamed salah. All rights reserved.
//

import UIKit


protocol APIClient{
  
    func executePostRequest(url:String,parameters: [String:Any]?,header : [String:String]?,success:@escaping (Any) -> Void, failure:@escaping (Error) -> Void)
  
    func executeGetRequest(url:String,parameters: [String:Any]?,header : [String:String]?,success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void)

}
