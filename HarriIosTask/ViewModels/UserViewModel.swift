//
//  UserViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import UIKit

/// User View Model
class UserViewModel: ViewModel {
    
    /// Number of sections
    var NUMBER_OF_SECTIONS: Int = 1
    
    /// Users
    private(set) var users: [User]
    
    /// Representables
    private var representables: [TableViewCellRepresentable]
    
    /// Hits
    private(set) var hits: Int
    
    /**
     Initializer
     - Parameter users: Array of User
     - Parameter hits: Integer
     */
    init(with users: [User], total hits: Int) {
        self.users = users
        self.hits = hits
        self.representables = [LoadingTableViewCellRepresentable()]
        self.setupRepresentables()
    }

    /**
     Append results
     - Parameter results: Array of User
     - Parameter hits: Integer
     */
    func appendResults(results: [User], total hits: Int) {
        self.users.append(contentsOf: results)
        self.hits = hits
        self.representables = [LoadingTableViewCellRepresentable()]
        self.setupRepresentables()
    }
    
    /**
     Setup representables
     */
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
    
    // MARK: - ViewModel Conformance
    
    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int {
        return self.representables.count
    }
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return self.representables[indexPath.row].cellHeight
    }
    
    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.representables[indexPath.row]
    }
}
