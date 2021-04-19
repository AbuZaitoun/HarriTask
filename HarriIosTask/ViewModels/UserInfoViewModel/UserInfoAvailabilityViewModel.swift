//
//  UserInfoAvailabilityViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

class UserInfoAvailabilityViewModel: ViewModel, CollectionViewModel {
    
    var representables: [UserInfoAvailabilityRepresentable]
    var availabilityRepresentables: [UserInfoAvailabilityRepresentable]
    var availability: [(String, Bool)]

    init(with availability: [(String, Bool)]) {
        self.representables = []
        self.availabilityRepresentables = []
        self.availability = availability
        self.setupRepresentables()
    }
    
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
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return self.representables[indexPath.row].cellHeight
    }
    
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.representables[indexPath.row]
    }
    
    func numberOfItemsInSection(inSection section: Int) -> Int {
        return self.availabilityRepresentables.count
    }
    
    func representableForCollection(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.availabilityRepresentables[indexPath.row]
    }
    
    
}
