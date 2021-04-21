//
//  UserInfoExperienceViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// User Info Experience View Model
class UserInfoExperienceViewModel: ViewModel {
    
    /// Number of sections
    private let NUMBER_OF_SECTIONS = 1
    
    /// representables
    var representables: [TableViewCellRepresentable]
    
    /// User experience
    var userExperience: [UserExperience]
    
    /** initializer
     - Parameter userInfo: [UserExperience]
    */
    init(with userExperience: [UserExperience]) {
        self.userExperience = userExperience
        self.representables = [LoadingTableViewCellRepresentable()]
        if userExperience.count > 0 {
            self.setupRepresentable()
        }
        
    }
    
    /// Setup representable
    func setupRepresentable() {
        self.representables = []
        
        for work in userExperience {
            let representable = UserInfoExperienceRepresentable(with: work.work)
            self.representables.append(representable)
        }
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
