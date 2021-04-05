//
//  User.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

struct User: Decodable {
    var firstName: String
    var lastName: String
    var id: Int
    var isFirstJob: Bool?
    var position: UserPosition?
    var location: UserLocation
    var profileImageUUID: String?
    
    var positionText: String {
        if isFirstJob ?? false {
            return "Looking for first job"
        }else if let positionName = self.position?.name{
            return positionName
        }else {
            return "Looking for first job"
        }
    }
    var locationText: String {
        return self.location.city ?? "Unknown"
    }
    var fullName: String {
        return self.firstName + " " + self.lastName
    }
    var imageURL: String? {
        if let uuid = self.profileImageUUID {
        return "https://d7f8bv52wga7t.cloudfront.net/users/\(id)/user_profile/\(uuid)/240_240.jpeg"
        }
        else {return nil}
    }
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
