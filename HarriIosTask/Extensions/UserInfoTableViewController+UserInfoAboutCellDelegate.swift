//
//  UserInfoTableViewController+UserInfoAboutCellDelegate.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

extension UserInfoTableViewController: UserInfoAboutCellDelegate {
    func labelClicked(indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! UserInfoAboutTableViewCell
        
        cell.setupCell(with: aboutViewModel.representableForRow(at: indexPath) as! UserInfoAboutRepresentable, shouldExpand: true)
        self.tableView.reloadRows(at: [IndexPath(item: indexPath.row, section: 0)], with: .automatic)
    }
}
