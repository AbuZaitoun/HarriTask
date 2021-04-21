//
//  UserInfoAvailabilityRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

/// User Info Available Representable
class UserInfoAvailabilityRepresentable: TableViewCellRepresentable {
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /// Available text
    var availableText: String?
    
    /// Availabilities
    var availabilities: [(String, Bool)]?
    
    /** Initializer
     - Parameter availability: (String, Bool)
    */
    init(with availability: (String, Bool)) {
        self.cellHeight = UserInfoAvailabilityTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAvailabilityTableViewCell.getReuseModifier()
        
        self.availableText = availability.0
    }
    
    /** Initializer
     - Parameter availabilities: [(String, Bool)]
    */
    init(with availabilities: [(String, Bool)]) {
        self.cellHeight = UserInfoAvailabilityTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAvailabilityTableViewCell.getReuseModifier()
        
        self.availabilities = availabilities
    }
}
