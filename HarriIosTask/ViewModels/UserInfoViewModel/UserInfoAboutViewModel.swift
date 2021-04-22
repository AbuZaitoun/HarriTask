//
//  UserInfoAboutViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import UIKit

/// User Info About View Model
class UserInfoAboutViewModel: ViewModel {
    
    /// Number of sections
    private let NUMBER_OF_SECTIONS = 1
    
    /// User info
    var userInfo: UserInfo
    
    /// Representables
    var representables: [TableViewCellRepresentable]
    
    /** initializer
     - Parameter userInfo: User Info
    */
    init(userInfo: UserInfo){
        self.userInfo = userInfo
        self.representables = [LoadingTableViewCellRepresentable()]
        self.setupRepresentable()
    }
    
    /// Setup representable
    private func setupRepresentable(){
        self.representables = [UserInfoAboutRepresentable(with: self.userInfo)]
    }
    
    func toggleExpanded(for indexPath: IndexPath) {
        guard let representable = self.representableForRow(at: indexPath) as? UserInfoAboutRepresentable else {
            return
        }
        representable.isExpanded.toggle()
    }
    
    
    /** Number of sections
     - Returns: Integer,  number of sections
    */
    func numberOfSections() -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    /** Number of rows in section
     - Parameter section: Integer, section
     - Returns: Integer
    */
    func numberOfRows(inSection section: Int) -> Int {
        return self.representables.count
    }
    
    /** Height for row
     - Parameters:
       - indexPath: IndexPath
       - tableView: UITableView
     - Returns: CGFloat
    */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return self.representables[indexPath.row].cellHeight
    }
    
    
    /** Representable for row
     - Parameter indexPath: IndexPath
     - Returns: TableViewCellRepresentable
    */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.representables[indexPath.row]
    }
}
