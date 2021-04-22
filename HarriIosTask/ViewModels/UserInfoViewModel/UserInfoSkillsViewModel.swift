//
//  UserInfoSkillsViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// User Info Skills View Model
class UserInfoSkillsViewModel: ViewModel, CollectionViewModel {
    
    /// Representables
    var representables: [TableViewCellRepresentable] // Refactor
    
    /// Skill Representables
    var skillRepresentable: [UserInfoSkillsRepresentable]
    
    /// Skills
    var skills: [Skill]
    
    /** Initializer
     - Parameter skills: [Skill]
    */
    init(with skills: [Skill]) {
        self.representables = []
        self.skillRepresentable = []
        self.skills = skills
        if !skills.isEmpty {
            self.setupRepresentables(skills: skills)
        } else {
            self.representables.append(ZeroExperienceRepresentable(with: "No skills to show"))
        }
        
    }
    
    
    /** Set up representables
     - Parameter skills: [Skill]
    */
    func setupRepresentables(skills: [Skill]) {
        self.representables = []
        self.skillRepresentable = []
        self.representables.append(UserInfoSkillsRepresentable(with: skills))
        for skill in self.skills {
            self.skillRepresentable.append(UserInfoSkillsRepresentable(with: skill))
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
        return self.skillRepresentable.count
    }
    
    
    /** Representable for collection
     - Parameter indexPath: IndexPath
     - Returns: TableViewCellRepresentable
    */
    func representableForCollection(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.skillRepresentable[indexPath.row]
    }
    
}
