//
//  UserAPI.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import Alamofire
import Foundation
class UserNetworkManager {
    
    static let shared = UserNetworkManager()
    let size: Int
    var start: Int
    
    private init(){
        self.size = 20
        self.start = 0
    }

    
    func fetchUsers(refresh: Bool, completion : @escaping (Users) -> ()){
        if refresh {
            self.start = 0
        }
        let params = ["size":size, "start":start, "locations":["40.7127753","-74.0059728"]] as [String : Any]
        
        AF.request(UserRouter.readUsers(params: params)).responseJSON() { response in
            // TO-DO: Fix retained cycle presented by self
           
            switch response.result {
                        case .success:
                            guard let data = response.data else {
                                let error = NSError(domain:"No Data", code: 999, userInfo: nil)
//                                completion?(nil, error)
                                return
                            }
                            guard let responseObject = try? JSONDecoder().decode(ResponseData.self, from: data) else {
                                let error = NSError(domain: "Failed to decode object", code: 999, userInfo: nil)
//                                completion?(nil, error)
                                return
                            }
                            completion(responseObject.data)
            case .failure: break
//                            completion?(nil, response.error)
                        }
            self.start = self.start + self.size
            
        }
    }
}
