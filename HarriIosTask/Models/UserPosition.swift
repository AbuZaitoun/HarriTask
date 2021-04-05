//
//  Position.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

struct UserPosition: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
