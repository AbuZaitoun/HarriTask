//
//  UserDetails.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import Foundation

struct UserDetails: Codable {
    
    var userInfo: UserInfo
    //Availability goes here along side others
    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
    }
}


struct UserDetailsData: Codable {
    
    var data: UserDetails
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
