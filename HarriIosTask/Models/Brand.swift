//
//  Brand.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

struct Brand: Codable {
    
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
