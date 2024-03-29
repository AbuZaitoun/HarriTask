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
    private(set) var skillName: String?
    
    /// Skills
    private(set) var skills: [Skill]?
    
    /** Initializer
     - Parameter skills: [Skill]
    */
    init(with skills: [Skill]) {
        self.skills = skills
        self.cellHeight = SkillsListTableViewCell.getHeight()
        self.reuseIdentifier = SkillsListTableViewCell.getReuseIdentifier()
    }

}
