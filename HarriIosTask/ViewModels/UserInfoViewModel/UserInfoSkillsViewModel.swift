//
//  UserInfoSkillsViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

class UserInfoSkillsViewModel: ViewModel {
    
    
    var representables: [UserInfoSkillsRepresentable]
    
    init(with skills: [Skill]) {
        self.representables = []
        
        self.setupRepresentables(skills: skills)
    }
    
    func setupRepresentables(skills: [Skill]) {
        self.representables.append(UserInfoSkillsRepresentable(with: skills))
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
    
}
