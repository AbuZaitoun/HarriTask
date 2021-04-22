//
//  UserExperience.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

/// User Experience
struct UserExperience: Codable {
    
    /// Work
    var work: Work
    
    /// Initializer
    init() {
        self.work = Work()
    }
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case work = "Work"
    }
}
