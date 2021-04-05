//
//  Users.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

struct Users: Decodable {
    var hits: Int
    var all: [User]
    
    enum CodingKeys: String, CodingKey {
        case hits
        case all = "results"
    }
}
