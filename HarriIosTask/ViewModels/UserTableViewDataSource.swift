//
//  UserTableViewDataSource.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

import Foundation
import UIKit

class UserTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var cellIdentifier : String!
    private var items : [User]!
    var configureCell : (UserTableViewCell, User) -> () = {_,_ in }
    
    
    init(cellIdentifier : String, items : [User], configureCell : @escaping (UserTableViewCell, User) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return items.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserTableViewCell
            
            let item = self.items[indexPath.row]
            self.configureCell(cell, item)
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let offsetY = scrollView.contentOffset.y
//            let contentHeight = scrollView.contentSize.height
//
//            if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
//                self.userViewModel.fetchData()
//            }
//        }
}
