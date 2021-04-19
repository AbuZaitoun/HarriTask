//
//  SkillViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

class SkillViewModel {
    
    var representables: [SkillRepresentable]
    var skills: [Skill]
    init(with skills: [Skill]) {
        self.skills = skills
        self.representables = []
        self.setupRepresentables()
    }
    
    func setupRepresentables(){
        self.representables = []
        for skill in skills {
            self.representables.append(SkillRepresentable(with: skill))
        }
    }
    
    func numberOfItemsInSection(inSection section: Int) -> Int {
        return self.representables.count
    }
    
    func representableForRow(at indexPath: IndexPath) -> SkillRepresentable {
        return self.representables[indexPath.row]
    }
}
