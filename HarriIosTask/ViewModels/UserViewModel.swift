//
//  UserViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import UIKit

class UserViewModel: ViewModel {
    
    private let NUMBER_OF_SECTIONS = 1
    private(set) var users: [User]
    private var representables: [TableViewCellRepresentable]
    private(set) var hits: Int
    
    init(with users: [User], total hits: Int) {
        self.users = users
        self.hits = hits
        self.representables = [LoadingTableViewCellRepresentable()]
        self.setupRepresentables()
    }

    func appendResults(results: [User], total hits: Int) {
        self.users.append(contentsOf: results)
        self.hits = hits
        self.representables = [LoadingTableViewCellRepresentable()]
        self.setupRepresentables()
    }
    
    private func setupRepresentables() {
        self.representables = []
        print(self.users.count)
        for user in self.users {
            self.representables.append(UserTableViewCellRepresentable(with: user))
        }
        
        if self.users.count < self.hits {
            self.representables.append(LoadingTableViewCellRepresentable())
        }
    }
    
    // MARK: - ViewModel
    
    func numberOfSections() -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return self.representables.count
    }
    
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return self.representables[indexPath.row].cellHeight
    }
    
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.representables[indexPath.row]
    }
}
