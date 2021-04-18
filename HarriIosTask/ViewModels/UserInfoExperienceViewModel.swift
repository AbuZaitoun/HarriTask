//
//  UserInfoExperienceViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

class UserInfoExperienceViewModel: ViewModel {
    
    private let NUMBER_OF_SECTIONS = 1
    
    var representables: [UserInfoExperienceRepresentable]
    var userExperience: [UserExperience]
    
    init(with userExperience: [UserExperience]) {
        self.userExperience = userExperience
        self.representables = []
        self.setupRepresentable()
    }
    
    func setupRepresentable() {
        self.representables = []
        
        for work in userExperience {
            let representable = UserInfoExperienceRepresentable(with: work.work)
            self.representables.append(representable)
        }
    }
    
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
