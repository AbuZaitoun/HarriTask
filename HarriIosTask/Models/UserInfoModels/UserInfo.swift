//
//  UserInfo.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import Foundation

struct UserInfo: Codable {
    
    var about: String
    
    enum CodingKeys: String, CodingKey {
        case about
    }
}
