//
//  Brand.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

/// Brand
struct Brand: Codable {
    
    /// Name
    var name: String
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case name
    }
}
