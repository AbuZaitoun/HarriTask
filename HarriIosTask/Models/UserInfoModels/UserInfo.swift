//
//  UserInfo.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import Foundation

/// User Info
struct UserInfo: Codable {
    
    /// About
    var about: String?
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case about
    }
}
