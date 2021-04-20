//
//  UserInfoHeaderRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation

class UserInfoHeaderRepresentable {
    
    private(set) var name: String
    private(set) var position: String
    private(set) var profilePictureURL: String?
    private(set) var backgroundPictureURL: String?
    
    init(with user: User) {
        self.name = user.fullName
        self.position = user.position?.name ?? ""
        self.profilePictureURL = user.imageURL
        self.backgroundPictureURL = user.backgroundURL
    }
}
