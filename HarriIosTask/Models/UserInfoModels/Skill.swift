//
//  Skill.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

/// Skill
struct Skill: Codable {
    
    /// Name
    var name: String
    
    /// Id
    var id: Int
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case name
        case id
    }
}
