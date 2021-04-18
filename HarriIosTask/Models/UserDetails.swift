//
//  UserDetails.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import Foundation

struct UserDetails: Codable {
    
    var userInfo: UserInfo
    var experience: [UserExperience]
    var currentJob: String
    var skills: [Skill]
    //Availability goes here along side others
    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
        case experience = "experience"
        case currentJob = "current_job"
        case skills = "user_skill"
    }
}


struct UserDetailsData: Codable {
    
    var data: UserDetails
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
