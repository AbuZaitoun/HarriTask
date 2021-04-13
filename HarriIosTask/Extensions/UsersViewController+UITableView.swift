//
//  UsersViewController+UITableView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 12/04/2021.
//

import UIKit

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.usersViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersViewModel.numberOfRows(inSection: section)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height) && !self.isLoading && self.usersViewModel.users.count < self.usersViewModel.hits {
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
