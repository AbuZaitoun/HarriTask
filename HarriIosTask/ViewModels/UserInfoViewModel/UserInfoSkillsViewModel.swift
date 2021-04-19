//
//  UserInfoSkillsViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

class UserInfoSkillsViewModel: ViewModel, CollectionViewModel {
    
    
    var representables: [UserInfoSkillsRepresentable] // Refactor
    var skillRepresentable: [UserInfoSkillsRepresentable]
    
    var skills: [Skill]
    init(with skills: [Skill]) {
        self.representables = []
        self.skillRepresentable = []
        self.skills = skills
        self.setupRepresentables(skills: skills)
    }
    
    func setupRepresentables(skills: [Skill]) {
        self.representables = []
        self.skillRepresentable = []
        self.representables.append(UserInfoSkillsRepresentable(with: skills))
        for skill in self.skills {
            self.skillRepresentable.append(UserInfoSkillsRepresentable(with: skill))
        }
    }
    
    // MARK: - ModelView Protocol Conformance
    
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
    
    
    // MARK: - CollectionViewModel Protocol Conformance
    
    func numberOfItemsInSection(inSection section: Int) -> Int {
        return self.skillRepresentable.count
    }
    
    func representableForCollection(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.skillRepresentable[indexPath.row]
    }
    
}
