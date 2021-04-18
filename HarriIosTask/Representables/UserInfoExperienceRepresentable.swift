//
//  UserInfoExperienceRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

class UserInfoExperienceRepresentable: TableViewCellRepresentable {
    
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
    var positionName: String
    var brandName: String
    var description: String
    var dateText: String
    
    init(with work: Work){
        self.description = work.description
        self.cellHeight = UserInfoExperienceTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoExperienceTableViewCell.getReuseModifier()
        
        self.brandName = work.brand.name
        if let position = work.position {
            self.positionName = position.name
        } else if let position = work.customPosition {
            self.positionName = position
        } else {
            self.positionName = "Position"
        }
        self.dateText = ""
    }
}
