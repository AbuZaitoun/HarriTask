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
    var aboutText: String?
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse indentifier
    var reuseIdentifier: String
    
    var noAboutText: String?
    
    /** Initializer
     - Parameter userInfo: UserInfo
    */
    init(with userInfo: UserInfo){
        if let text = userInfo.about {
            self.aboutText = text
        } else {
            self.noAboutText = "No info to show"
        }
        
        self.cellHeight = UserInfoAboutTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAboutTableViewCell.getReuseIdentifier()
    }
}
