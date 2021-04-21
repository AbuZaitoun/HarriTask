//
//  ZeroExperienceRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

class ZeroExperienceRepresentable: TableViewCellRepresentable {
    
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
    var NO_EXPERIENCE_TEXT = "No experience to show"
    
    init() {
        self.cellHeight = ZeroExperienceCell.getHeight()
        self.reuseIdentifier = ZeroExperienceCell.getReuseIdentifier()
    }
}
