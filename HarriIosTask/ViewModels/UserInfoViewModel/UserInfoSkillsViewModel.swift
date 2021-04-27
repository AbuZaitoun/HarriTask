//
//  UserInfoSkillsViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// User Info Skills View Model
class UserInfoSkillsViewModel: ViewModel {
    
    /// Representables
    var representables: [TableViewCellRepresentable] // Refactor
    
    /// Skills
    var skills: [Skill]
    
    var width: CGFloat
    
    /** Initializer
     - Parameter skills: [Skill]
    */
    init(with skills: [Skill], width: CGFloat) {
        self.representables = []
        self.skills = skills
        self.width = width - 80
        if width <= 0 {
            return
        }
        if !skills.isEmpty {
            self.sortSkillsAccordingToLength()
        } else {
            self.representables.append(ZeroExperienceRepresentable(with: "No skills to show"))
        }
        
    }
    
    func sortSkillsAccordingToLength() {
        self.representables = []
        
        let font = UIFont(name: "OpenSans-Light", size: 13)
        
        
        let maxWidth = self.width
        
        var usedItems: [Int] = []
        let sorted = self.skills.sorted(by: {(skill1, skill2) -> Bool in
            return skill1.name.labelSize(for: font!, widthLimit: maxWidth).width > skill2.name.labelSize(for: font!, widthLimit: maxWidth).width
        })
        
        var toPresent: [Skill] = []
        var result: CGFloat
        var labelWidth: CGFloat
        
        for skill in sorted {
            if (usedItems.contains(skill.id)) {
                continue
            }
            usedItems.append(skill.id)
            toPresent.append(skill)
            
            result = skill.name.labelSize(for: font!, widthLimit: maxWidth).width
            
            for smallSkill in sorted {
                if usedItems.contains(smallSkill.id) {
                    continue
                }
                labelWidth = smallSkill.name.labelSize(for: font!, widthLimit: maxWidth).width
                if (result + labelWidth + 85) < maxWidth {
                    usedItems.append(smallSkill.id)
                    toPresent.append(smallSkill)
                    result += labelWidth
                    
                }

            }

        }

        self.skills = toPresent
        self.representables.append(UserInfoSkillsRepresentable(with: toPresent))

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
