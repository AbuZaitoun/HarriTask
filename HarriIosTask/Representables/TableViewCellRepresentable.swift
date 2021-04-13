//
//  TableViewCellRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 13/04/2021.
//

import UIKit

protocol TableViewCellRepresentable {
    var cellHeight: CGFloat { get set }
    var reuseIdentifier: String { get set }
}
