//
//  UserTableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 12/04/2021.
//

import UIKit

/// User Table View Cell Representable
class UserTableViewCellRepresentable: TableViewCellRepresentable {
    
    /// First job text
    private let FIRST_JOB_TEXT = "Is looking for their first job"
    
    /// Name
    private(set) var name: String
    
    /// Details text
    private(set) var detailsText: NSAttributedString

    /// Image url
    private(set) var imageURL: String?
    
    /// Position Text
    private(set) var positionText: String?
    
    /// User
    private(set) var user: User?
    
    /// User id
    var userID: String
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /**
     Initializer
     sets up UserTableViewRepresentable with User object
     - Parameter user: User
     */
    init(with user: User) {
        self.name = user.fullName
        self.cellHeight = UserTableViewCell.getHeight()
        self.reuseIdentifier = UserTableViewCell.getReuseModifier()
        self.imageURL = user.imageURL
        self.positionText = user.position?.name
        self.user = user
        self.userID = String(user.id)
        var attributedString: NSMutableAttributedString
        if user.isFirstJob ?? false {
            attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: self.FIRST_JOB_TEXT, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), NSAttributedString.Key.font: UIFont(name: "OpenSans-Italic", size: 14)]))
        } else {
            attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: (user.position?.name ?? "") + ", ", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 14)]))
            attributedString.append(NSAttributedString(attributedString: NSAttributedString(string: user.location.city ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Regular", size: 14)])))
        }

        self.detailsText = attributedString
    }
}
