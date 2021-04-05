//
//  User.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

struct User: Decodable {
    var firstName: String
    var lastName: String
    // var location: String
    var isFirstJob: Bool?
    var position: UserPosition?
    var location: UserLocation
    
    var positionText: String {
        if isFirstJob ?? false {
            return "Looking for first job"
        }else {
            return self.position!.name
        }
    }
    var locationText: String {
        return self.location.city ?? "Unknown"
    }
    var fullName: String {
        return self.firstName + " " + self.lastName
    }
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case isFirstJob
        case position
        case location
    }
}
