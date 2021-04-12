//
//  UserTableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 12/04/2021.
//

import UIKit

class UserTableViewCellRepresentable {
    
    private(set) var name: String
    private(set) var position: String?
    private(set) var location: String?
    
    /// Cell height
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
    init(with user: User) {
        self.name = user.fullName
        self.position = user.position?.name
        self.location = user.location.city
        
        self.cellHeight = UserTableViewCell.getHeight()
        self.reuseIdentifier = UserTableViewCell.getReuseModifier()
    }
}
