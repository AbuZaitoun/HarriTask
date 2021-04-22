//
//  Position.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

/// Position
struct Position: Codable {
    
    /// Name
    var name: String
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case name
    }
}
