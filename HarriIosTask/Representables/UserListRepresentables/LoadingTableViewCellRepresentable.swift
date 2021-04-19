//
//  LoadingTableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 13/04/2021.
//

import UIKit

/// Loading Table View Cell Representable
class LoadingTableViewCellRepresentable: TableViewCellRepresentable {
    
    /// Loading text
    let LOADING_TEXT = "Loading"
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /** Initializer
     
     */
    init() {
        self.cellHeight = LoadingTableViewCell.getHeight()
        self.reuseIdentifier = LoadingTableViewCell.getReuseModifier()
    }
}
