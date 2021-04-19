//
//  ExperienceRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

class SkillRepresentable {
    
    var title: String

    init(with skill: Skill) {
        self.title = skill.name
    }
}
