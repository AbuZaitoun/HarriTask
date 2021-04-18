//
//  UserInfoAboutRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import UIKit

class UserInfoAboutRepresentable: TableViewCellRepresentable {
    
    var aboutText: String
    
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
    init(with userInfo: UserInfo){
        self.aboutText = userInfo.about
        self.cellHeight = UserInfoAboutTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoAboutTableViewCell.getReuseModifier()
    }
}
