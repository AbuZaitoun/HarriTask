//
//  Work.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

struct Work: Codable {
//    var customPosition: String
//    var startDate: String
//    var endDate: String?
    var description: String
//    var brand: Brand
//
    init() {
//        self.customPosition = ""
//        self.startDate = ""
        self.description = ""
//        self.brand = Brand(name: "")
    }
    
    enum CodingKeys: String, CodingKey {
//        case customPosition = "custom_position"
        case description = "description"
//        case startDate = "start_date"
//        case endDate = "end_date"
//        case brand
    }
}
