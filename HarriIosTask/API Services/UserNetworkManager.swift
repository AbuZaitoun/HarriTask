//
//  UserAPI.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import Alamofire
import Foundation
class UserNetworkManager {
    private let URL_STRING = "https://gateway.harridev.com/core/api/v1/harri_search/search_users"
    
    var size = 20
    var start = 0
    
    func fetchUsers(refresh: Bool, completion : @escaping (Users) -> ()){
        if refresh {
            start = 0
        }
        let params = ["size":size, "start":start, "locations":["40.7127753","-74.0059728"]] as [String : Any]
        AF.request(URL_STRING, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseDecodable(of: ResponseData.self) { response in
            // TO-DO: Fix retained cycle presented by self
            print(response)
            guard let responseData = response.value
            else {
                return
            }
            completion(responseData.data)
            self.start = self.start + self.size
        }
    }
}
