//
//  ViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 12/04/2021.
//

import UIKit

protocol ViewModel {
    /**
     Get number of sections
     - Returns: Number of Sections as Int.
     */
    func numberOfSections() -> Int
    
    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView ) -> CGFloat
    
    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable?
}
