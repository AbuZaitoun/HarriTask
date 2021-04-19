//
//  User.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//
import Foundation

/// User
struct User: Codable {
    
    /// First name
    var firstName: String
    
    /// Last name
    var lastName: String
    
    /// Id
    var id: Int
    
    /// Is first job
    var isFirstJob: Bool?
    
    /// Position
    var position: UserPosition?
    
    /// Location
    var location: UserLocation
    
    /// Profile image uuid
    var profileImageUUID: String?
    
    /// Full name
    var fullName: String {
        return self.firstName + " " + self.lastName
    }
    
    /// Image url
    var imageURL: String? {
        if let uuid = self.profileImageUUID {
        return "https://d7f8bv52wga7t.cloudfront.net/users/\(id)/user_profile/\(uuid)/240_240.jpeg"
        }
        else {return nil}
    }
    
    /** Initializer

     */
    init() {
        self.firstName = ""
        self.lastName = ""
        self.id = -1
        self.location = UserLocation()
    }
    
    // MARK: - Codable
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case id
        case isFirstJob
        case position
        case location
        case profileImageUUID
    }
}


/// Users
struct Users: Codable {
    
    /// Hits
    var hits: Int
    
    /// All
    var all: [User]
    
    // MARK: - Codable
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case hits
        case all = "results"
    }
}

/// Response Data
struct ResponseData: Codable {
    
    /// Data
    var data: Users
    
    // MARK: - Codable
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case data
    }
}
