//
//  UserInfoAvailabilityViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

/// User Info Availability
class UserInfoAvailabilityViewModel: ViewModel, CollectionViewModel {
    
    /// Representables
    var representables: [UserInfoAvailabilityRepresentable]
    
    /// Availability Representables
    var availabilityRepresentables: [UserInfoAvailabilityRepresentable]
    
    /// Availability
    var availability: [(String, Bool)]
    
    /** Initializer
     - Parameter availability: [(String, Bool)]
    */
    init(with availability: [(String, Bool)]) {
        self.representables = []
        self.availabilityRepresentables = []
        self.availability = availability
        self.setupRepresentables()
    }
    
    /// set up represntables
    func setupRepresentables() {
        self.representables = []
        self.availabilityRepresentables = []
        self.representables = [UserInfoAvailabilityRepresentable(with: self.availability)]
        for item in self.availability {
            if item.1 {
                self.availabilityRepresentables.append(UserInfoAvailabilityRepresentable(with: item))
            }
        }
    }
    
    // MARK: - ModelView Protocol Conformance
    
    /** Number of sections
     - Returns: Integer,  number of sections
    */
    func numberOfSections() -> Int {
        return 1
    }
    
    /** Number of rows in section
     - Parameter section: Integer, section
     - Returns: Integer
    */
    func numberOfRows(inSection section: Int) -> Int {
        return 1
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
    
    // MARK: - CollectionViewModel Protocol Conformance
    
    /** Number of items in section
     - Parameter section: Integer, section
     - Returns: Integer, number of items in said section
    */
    func numberOfItemsInSection(inSection section: Int) -> Int {
        return self.availabilityRepresentables.count
    }
    
    /** Representable for collection
     - Parameter indexPath: IndexPath
     - Returns: TableViewCellRepresentable
    */
    func representableForCollection(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.availabilityRepresentables[indexPath.row]
    }
    
    
}
