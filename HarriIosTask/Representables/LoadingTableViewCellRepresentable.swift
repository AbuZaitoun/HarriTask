//
//  LoadingTableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 13/04/2021.
//

import UIKit

class LoadingTableViewCellRepresentable: TableViewCellRepresentable {
    
    let LOADING_TEXT = "Loading"
    
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
    init() {
        self.cellHeight = LoadingTableViewCell.getHeight()
        self.reuseIdentifier = LoadingTableViewCell.getReuseModifier()
    }
}
