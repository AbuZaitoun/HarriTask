//
//  Position.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

struct UserPosition: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct UserLocation: Codable {
    var city: String?
    var state: String?
    
    enum CodingKeys: String, CodingKey {
        case city, state
    }
}
