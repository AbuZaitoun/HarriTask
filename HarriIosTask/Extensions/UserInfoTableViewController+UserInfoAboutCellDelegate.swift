//
//  UserInfoTableViewController+UserInfoAboutCellDelegate.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

// MARK: - UserInfoAboutCellDelegate Protocol Conformance

extension UserInfoTableViewController: UserInfoAboutCellDelegate {
    
    /** Label clicked
     - Parameter indexPath: IndexPath
     */
    func labelClicked(indexPath: IndexPath) {
        
        let cell = self.tableView.cellForRow(at: indexPath) as! UserInfoAboutTableViewCell
        cell.setupCell(with: aboutViewModel.representableForRow(at: indexPath) as! UserInfoAboutRepresentable, shouldExpand: true)
        self.tableView.reloadRows(at: [IndexPath(item: indexPath.row, section: 0)], with: .automatic)
    }
}
