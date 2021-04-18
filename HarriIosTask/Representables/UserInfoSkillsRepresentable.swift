//
//  UserInfoSkillsRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

class UserInfoSkillsRepresentable: TableViewCellRepresentable {
    var cellHeight: CGFloat
    
    var reuseIdentifier: String
    
//    var skillName: String
    var skills: [Skill]
    init(with skills: [Skill]) {
        self.skills = skills
//        self.skillName = skill.name
        self.cellHeight = UserInfoSkillsTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoSkillsTableViewCell.getReuseModifier()
    }
}
