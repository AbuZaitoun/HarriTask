//
//  UserLocation.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

struct UserLocation: Decodable {
    var city: String?
    var state: String?
    
    enum CodingKeys: String, CodingKey {
        case city, state
    }
}
