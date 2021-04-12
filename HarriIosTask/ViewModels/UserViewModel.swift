//
//  UserViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import UIKit

class UserViewModel: ViewModel {
    
    private let NUMBER_OF_SECTIONS = 1
    private var users: [User]
    private var userRepresentable: [UserTableViewCellRepresentable]
    
    init(with users: [User]) {
        self.users = users
        self.userRepresentable = []
    }

    private func setupRepresentables() {
        self.userRepresentable = []
        
        for user in self.users {
            self.userRepresentable.append(UserTableViewCellRepresentable(with: user))
        }
    }
    
    // MARK: - ViewModel
    
    func numberOfSections() -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return self.userRepresentable.count
    }
    
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return self.userRepresentable[indexPath.row].cellHeight
    }
    
    func representableForRow(at indexPath: IndexPath) -> UserTableViewCellRepresentable? {
        return self.userRepresentable[indexPath.row]
    }
}
