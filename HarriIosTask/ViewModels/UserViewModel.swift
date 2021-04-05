//
//  UserViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

struct UserViewModel {
    var name: String
    var locationText: String
    var jobText: String
    var pictureLink: String
    
    init(with: User) {
        self.name = with.fullName
        self.locationText = with.locationText
        self.jobText = with.positionText
        self.pictureLink = ""
    }
}
