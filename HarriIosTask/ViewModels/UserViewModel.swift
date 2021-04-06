//
//  UserViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import Foundation

class UserViewModel {
    var bindUserViewModelToController : (() -> ()) = {}
    var firstJob: Bool?
    var name: String
    var locationText: String
    var positionText: String
    var pictureURL: String?
    
    init(with: User) {
        self.name = with.fullName
        self.locationText = with.locationText
        self.positionText = with.positionText
        self.firstJob = with.isFirstJob
        if let uuid = with.profileImageUUID {
            self.pictureURL = "https://d7f8bv52wga7t.cloudfront.net/users/\(with.id)/user_profile/\(uuid)/240_240.jpeg"
        }
    }

}
