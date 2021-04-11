//
//  UserAPI.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import Alamofire
import Foundation
class UsersModel {
    
    static let shared = UsersModel()
    
    let max_tries = 2
    let size: Int
    var start: Int
    let fetchUsersParams: [String : Any]
    
    private init(){
        self.size = 20
        self.start = 0
        self.fetchUsersParams = ["size":size, "start":start, "locations":["40.7127753","-74.0059728"]]
    }
 
    func fetchUsers(refresh: Bool, tries: Int, completion : @escaping (Users?, Error?) -> ()){
        if refresh {
            self.start = 0
        }

        AF.request(UsersRouter.readUsers(params: fetchUsersParams)).responseJSON() { [weak self] response in
            guard let weak_self = self else { return }
            switch response.result {
            case .success:
                guard let data = response.data else {
                    let error = NSError(domain:"No Data", code: 999, userInfo: nil)
                    if tries < weak_self.max_tries {
                        weak_self.fetchUsers(refresh: refresh, tries: tries + 1, completion: completion)
                        return
                    } else {
                        completion(nil, error)
                        return
                    }
                }
                guard let responseObject = try? JSONDecoder().decode(ResponseData.self, from: data) else {
                    let error = NSError(domain: "Failed to decode object", code: 999, userInfo: nil)
                    
                    if tries < weak_self.max_tries {
                        weak_self.fetchUsers(refresh: refresh, tries: tries + 1, completion: completion)
                        return
                    } else {
                        completion(nil, error)
                        return
                    }
                }
                completion(responseObject.data, nil)
                weak_self.start = weak_self.start + weak_self.size
                
            case .failure:
                if tries < weak_self.max_tries{
                    weak_self.fetchUsers(refresh: refresh, tries: tries + 1, completion: completion)
                } else {
                    completion(nil, response.error)
                }
                
            }
        }
        
    }
}
