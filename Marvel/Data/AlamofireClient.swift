import Foundation
import Alamofire


struct AlamofireClient: APIClient {
    
    //MARK: Shared Instance
    
    static let sharedInstance =  AlamofireClient()
    
    private init() {
        
    }
    
    func executePostRequest(url:String,parameters: [String:Any]?,header : [String:String]?,success:@escaping (Any) -> Void, failure:@escaping (Error) -> Void){
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header ).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(response.result.value!)
                    success(data)
                }else{
                    success("false")
                }
                break
            case .failure(_):
                failure(response.result.error!)
                print(response.result.error!)
                break
                
            }
        }
        
    }
    
    func executeGetRequest(url:String,parameters: [String:Any]?,header : [String:String]?,success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void){
        
        
        print("URL:: \(url)")
        
        
        Alamofire.request(url, parameters: nil, encoding: JSONEncoding.default, headers: header).validate().responseJSON{ response in
            
            
            switch(response.result) {
                
            case .success( _):
//                let json = response.result.value
//                print(" - - - -  - - - - - - - ")
//                print("JSON: \(json)")
//                print(" - - - -  - - - - - - - ")
                success(response.data!)
                
            case .failure(let error):
                print(" - - - -  - - - - - - - ")
                print("### \(error.localizedDescription)")
                print(" - - - -  - - - - - - - ")
                failure(error)
                
            }
        }
        
    }
    
//    func connectedToNetwork() -> Bool {
//
//        var zeroAddress = sockaddr_in()
//        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//
//        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
//                SCNetworkReachabilityCreateWithAddress(nil, $0)
//            }
//        }) else {
//            return false
//        }
//
//        var flags: SCNetworkReachabilityFlags = []
//        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
//            return false
//        }
//
//        let isReachable = flags.contains(.reachable)
//        let needsConnection = flags.contains(.connectionRequired)
//
//        return (isReachable && !needsConnection)
//    }
//
//    
    
}
