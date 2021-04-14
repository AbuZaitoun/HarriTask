//
//  UsersViewController+UITableView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 12/04/2021.
//

import UIKit

/// User View Controller
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDelegate, UITableViewDataSource Conformance
    
    /**
     Tableview cell for row at
     - Parameter tableView: UITableView
     - Parameter indexPath: IndexPath
     - Returns UITableViewCell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let representable = self.usersViewModel.representableForRow(at: indexPath) else {
            return UITableViewCell()
        }
        if let myRepresentable = representable as? UserTableViewCellRepresentable {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.getReuseModifier(), for: indexPath) as! UserTableViewCell
                    cell.configure(with: myRepresentable)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.getReuseModifier(), for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        }
    }
    
    /**
     Number of sections in tableview
     - Parameter tableView: UITableView
     - Returns Integer
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.usersViewModel.numberOfSections()
    }
    
    /**
     Number of rows in section
     - Parameter tableView: UITableView
     - Parameter section: Int
     - Returns Int
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersViewModel.numberOfRows(inSection: section)
    }
    
    /**
     Scroll view did scroll
     - Parameter scrollView: UIScrollView
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height * 2) && !self.isLoading && self.usersViewModel.users.count < self.usersViewModel.hits {
            self.isLoading = true
            UsersModel.fetchUsers(start: self.requestStart, size: self.requestSize, completion: {(users_result, error) in
                if let users = users_result {
                    self.onCompletion(users: users)
                } else {
                    self.handleError(error: error)
                }
            })
        }
    }
}
