//
//  UserInfoHeaderRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation

/// User Info Header Representable
class UserInfoTableViewHeaderRepresentable {
    
    /// Name
    private(set) var name: String
    
    /// Position
    private(set) var position: String
    
    /// Profile Picture URL
    private(set) var profilePictureURL: String?
    
    /// Background Picture URL
    private(set) var backgroundPictureURL: String?
    
    
    /** Initializer
     - Parameter user: User
    */
    init(with user: User) {
        self.name = user.fullName
        self.position = user.position?.name ?? ""
        self.profilePictureURL = user.imageURL
        self.backgroundPictureURL = user.backgroundURL
    }
}
