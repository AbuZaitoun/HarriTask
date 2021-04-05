//
//  ResponseData.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

struct ResponseData: Decodable {
    var data: Users
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
