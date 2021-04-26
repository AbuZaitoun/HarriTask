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
    
    var width: CGFloat
    
    /** Initializer
     - Parameter skills: [Skill]
    */
    init(with skills: [Skill], width: CGFloat) {
        self.representables = []
        self.skillRepresentable = []
        self.skills = skills
        self.width = width - 30
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
        if self.width > CGFloat(0) {
            self.sortSkillsAccordingToLength()
        }
//        for skill in skills {
//            self.skillRepresentable.append(UserInfoSkillsRepresentable(with: skill))
//        }
    }
    
    func sortSkillsAccordingToLength() {
        self.skillRepresentable = []
        
        let font = UIFont(name: "OpenSans-Light", size: 13)
        
        var numbers = self.skills
        let maxWidth = self.width
        var results: [Skill] = []
        var index = 0
        
        var usedItems: [Int] = []
        var sorted = self.skills.sorted(by: {(skill1, skill2) -> Bool in
            return skill1.name.labelWidth(for: font!, widthLimit: maxWidth) > skill2.name.labelWidth(for: font!, widthLimit: maxWidth)
        })
        
        var toPresent: [Skill] = []
        let reversed = sorted.reversed()
        for skill in sorted {
            if (usedItems.contains(skill.id)) {
                continue
            }
            usedItems.append(skill.id)
            toPresent.append(skill)
            var bestResult = CGFloat(1000)
            var result: CGFloat = skill.name.labelWidth(for: font!, widthLimit: maxWidth)
            var skillToUse: Skill = Skill(name: "", id: -1)
            for smallSkill in sorted {
                if usedItems.contains(smallSkill.id) {
                    continue
                }
//                result = target - smallSkill.name.labelWidth(for: font!, widthLimit: target)
                if (result + smallSkill.name.labelWidth(for: font!, widthLimit: maxWidth)) < maxWidth {
                    usedItems.append(smallSkill.id)
                    toPresent.append(smallSkill)
                    result += smallSkill.name.labelWidth(for: font!, widthLimit: maxWidth)
                    
                }
//                if result < bestResult {
//                    skillToUse = smallSkill
//                }
            }
//            usedItems.append(skillToUse.id)
        }
        print(toPresent.count)
        for skill in toPresent {
            self.skillRepresentable.append(UserInfoSkillsRepresentable(with: skill))
        }
//        while(!numbers.isEmpty) {
//            count += 1
//            var best_combination: [Skill] = []
//            var best_result = CGFloat(10000)
//            var best_sum = CGFloat(0)
//            for combination in numbers.combinationsWithoutRepetition {
//                var sum = CGFloat(0)
//                for number in combination {
//                    sum += number.name.labelWidth(for: font!, widthLimit: target)
//                }
//                let result = target - sum
//                if (abs(result) < best_result) {
//                    best_result = result
//                    best_combination = combination
//                    best_sum = sum
//
//                }
//            }
//            for element in best_combination {
//                results.append(element)
//                numbers = numbers.filter { $0.id != element.id }
//            }
//        //    print("\nbest sum \(best_combination) = \(best_sum)")
//        }
//        for skill in results {
//            self.skillRepresentable.append(UserInfoSkillsRepresentable(with: skill))
//        }
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
