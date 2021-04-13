//
//  UserAPI.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import Alamofire
import Foundation
class UsersModel {
    
    init(){
        
    }
 
    static func fetchUsers(start: Int, size: Int, completion : @escaping (Users?, Error?) -> ()){

        let fetchUsersParams = ["size":size, "start":start, "locations":["40.7127753","-74.0059728"]] as [String: Any]
        
        AF.request(UsersRouter.readUsers(params: fetchUsersParams), interceptor: MyInterceptor()).responseJSON() { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    let error = NSError(domain:"No Data", code: 999, userInfo: nil)
                    completion(nil, error)
                    return
                }
                guard let responseObject = try? JSONDecoder().decode(ResponseData.self, from: data) else {
                    let error = NSError(domain: "Failed to decode object", code: 999, userInfo: nil)
                    completion(nil, error)
                    return
                }
                
                completion(responseObject.data, nil)
                
            case .failure:
                completion(nil, response.error)
            }
        }
        
    }
}
