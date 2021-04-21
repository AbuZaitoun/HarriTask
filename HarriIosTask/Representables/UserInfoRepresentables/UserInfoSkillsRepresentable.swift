//
//  UserInfoSkillsRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// User Info Skills Representable
class UserInfoSkillsRepresentable: TableViewCellRepresentable {
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /// Skill name
    var skillName: String?
    
    /// Skills
    var skills: [Skill]?
    
    /** Initializer
     - Parameter skills: [Skill]
    */
    init(with skills: [Skill]) {
        self.skills = skills
//        self.skillName = skill.name
        self.cellHeight = UserInfoSkillsTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoSkillsTableViewCell.getReuseModifier()
    }
    
    /** Initializer
     - Parameter skill: Skill
    */
    init(with skill: Skill) {
        self.skillName = skill.name
        self.cellHeight = UserInfoSkillsTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoSkillsTableViewCell.getReuseModifier()
    }
}
