//
//  UserTableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 12/04/2021.
//

import UIKit

class UserTableViewCellRepresentable: TableViewCellRepresentable {
    
    let FIRST_JOB_TEXT = "Is looking for their first job"
    
    private(set) var name: String
    private(set) var detailsText: NSAttributedString
    private(set) var position: String?
    private(set) var location: String?
    private(set) var imageURL: String?
    private(set) var isFirstJob: Bool?
    /// Cell height
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
    init(with user: User) {
        self.name = user.fullName
        self.position = user.position?.name
        self.location = user.location.city
        self.imageURL = user.imageURL
        self.isFirstJob = user.isFirstJob
        self.cellHeight = UserTableViewCell.getHeight()
        self.reuseIdentifier = UserTableViewCell.getReuseModifier()
        
        var attributedString: NSMutableAttributedString
        if self.isFirstJob ?? false {
            attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: self.FIRST_JOB_TEXT, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1), NSAttributedString.Key.font: UIFont(name: "OpenSans-Italic", size: 14)]))
        } else {
            attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: (user.position?.name ?? "") + ", ", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-SemiBold", size: 14)]))
            attributedString.append(NSAttributedString(attributedString: NSAttributedString(string: user.location.city ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "OpenSans-Regular", size: 14)])))
        }

        self.detailsText = attributedString
    }
}
