//
//  UserInfoAboutRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import UIKit

/// User Info About Representable
class UserInfoAboutRepresentable: TableViewCellRepresentable {
    
    /// No info to show
    private let NO_INFO_TEXT = "No info to show"
    
    /// About text
    private(set) var aboutText: NSAttributedString?
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse indentifier
    var reuseIdentifier: String
    
    /// Is expanded
    var isExpanded: Bool
    
    /** Initializer
     - Parameter userInfo: UserInfo
    */
    init(with userInfo: UserInfo){
        if let text = userInfo.about {
            self.aboutText = NSMutableAttributedString(attributedString: NSAttributedString(string: text, attributes: [ NSAttributedString.Key.font: UIFont(name: "OpenSans-Regular", size: 13)!]))
        } else {
            let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = NSTextAlignment.center
            self.aboutText = NSMutableAttributedString(attributedString: NSAttributedString(string: self.NO_INFO_TEXT, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.55, green: 0.55, blue: 0.57, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle   ,NSAttributedString.Key.font: UIFont(name: "OpenSans-Light", size: 13)!]))
        }
        self.isExpanded = false
        self.cellHeight = UserInfoAboutTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAboutTableViewCell.getReuseIdentifier()
    }
}
