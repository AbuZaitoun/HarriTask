//
//  Position.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//


/// User Position
struct UserPosition: Codable {
    
    /// Name
    var name: String
    
    // MARK: - Codable
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case name
    }
}


/// User Location
struct UserLocation: Codable {
    
    /// City
    var city: String?
    
    /// State
    var state: String?
    
    // MARK: - Codable
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case city, state
    }
}
