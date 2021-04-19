//
//  UserInfoAvailabilityRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

class UserInfoAvailabilityRepresentable: TableViewCellRepresentable {
    
    var cellHeight: CGFloat

    var reuseIdentifier: String

    var availableText: String?
    
    var availabilities: [(String, Bool)]?
    
    init(with availability: (String, Bool)) {
        self.cellHeight = UserInfoAvailabilityTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAvailabilityTableViewCell.getReuseModifier()
        
        self.availableText = availability.0
    }
    
    init(with availabilities: [(String, Bool)]) {
        self.cellHeight = UserInfoAvailabilityTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAvailabilityTableViewCell.getReuseModifier()
        
        self.availabilities = availabilities
    }
}
