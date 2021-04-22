//
//  UserDetails.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import Foundation

/// User Details
struct UserDetails: Codable {
    
    /// User info
    var userInfo: UserInfo
    
    /// Experience
    var experience: [UserExperience]
    
    /// Current job
    var currentJob: String?
    
    /// Skills
    var skills: [Skill]
    
    /// Availabitlity
    var availability: Availability
    
    /// Background image
    var backgroundImage: String?
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
        case experience = "experience"
        case currentJob = "current_job"
        case skills = "user_skill"
        case availability = "availability"
        case backgroundImage = "background_image"
    }
}


/// User Details Data
struct UserDetailsData: Codable {
    
    /// Data
    var data: UserDetails
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case data
    }
}
