//
//  Skill.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

struct Skill: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
