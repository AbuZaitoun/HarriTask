//
//  UserInfoAboutRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import UIKit

/// User Info About Representable
class UserInfoAboutRepresentable: TableViewCellRepresentable {
    
    /// About text
    var aboutText: String
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse indentifier
    var reuseIdentifier: String
    
    /** Initializer
     - Parameter userInfo: UserInfo
    */
    init(with userInfo: UserInfo){
        self.aboutText = userInfo.about ?? "Wow, such empty"
        self.cellHeight = UserInfoAboutTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAboutTableViewCell.getReuseModifier()
    }
}
