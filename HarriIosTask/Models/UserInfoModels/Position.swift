//
//  Position.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

struct Position: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
