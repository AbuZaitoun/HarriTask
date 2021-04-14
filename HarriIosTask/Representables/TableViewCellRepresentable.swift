//
//  TableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 13/04/2021.
//

import UIKit

/// Table View Cell Representable
protocol TableViewCellRepresentable {
    
    /// Cell height
    var cellHeight: CGFloat { get set }
    
    /// Reuse identifier
    var reuseIdentifier: String { get set }
}
