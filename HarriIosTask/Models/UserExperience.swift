//
//  UserExperience.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

struct UserExperience: Codable {
    var workList: [Work]
    
    init() {
        self.workList = []
    }
    
    enum CodingKeys: String, CodingKey {
        case workList = ""
    }
}
