//
//  ZeroExperienceRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

/// Zero Experience Representable
class ZeroExperienceRepresentable: TableViewCellRepresentable {
    
    /// No experience text
    private(set) var noExperienceText: String
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /// Initializer
    init(with string: String) {
        self.cellHeight = ZeroExperienceCell.getHeight()
        self.reuseIdentifier = ZeroExperienceCell.getReuseIdentifier()
        self.noExperienceText = string
    }
}
