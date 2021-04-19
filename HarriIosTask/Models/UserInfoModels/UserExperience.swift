//
//  UserExperience.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

struct UserExperience: Codable {
    var work: Work
    
    init() {
        self.work = Work()
    }

    enum CodingKeys: String, CodingKey {
        case work = "Work"
    }
}
