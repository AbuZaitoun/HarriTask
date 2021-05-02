//
//  UserInfoViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 02/05/2021.
//

import UIKit

class UserInfoViewModel: ViewModel {
    
    private let NUMBER_OF_SECTIONS = 4
    
    var aboutRepresentables: [TableViewCellRepresentable]
    var experienceRepresentables: [TableViewCellRepresentable]
    var skillsRepresentables: [TableViewCellRepresentable]
    var availabilityRepresentables: [TableViewCellRepresentable]
    var tableViewHeaderRepresentable: UserInfoTableViewHeaderRepresentable?
    var headerRepresentable: HeaderViewRepresentable
    
    init(with userDetails: UserDetails, user: User, width: CGFloat){
        self.aboutRepresentables = [UserInfoAboutRepresentable(with: userDetails.userInfo)]
        self.experienceRepresentables = []
        self.availabilityRepresentables = []
        self.skillsRepresentables = []
        self.tableViewHeaderRepresentable = UserInfoTableViewHeaderRepresentable(with: user)
        self.headerRepresentable = HeaderViewRepresentable(alpha: 0)
        
        for experience in userDetails.experience {
            self.experienceRepresentables.append(UserInfoExperienceRepresentable(with: experience.work))
        }
        
        if !userDetails.skills.isEmpty {
            self.sortSkillsAccordingToLength(skills: userDetails.skills, width: width)
        } else {
            self.skillsRepresentables.append(ZeroExperienceRepresentable(with: "No skills to show"))
        }
        self.availabilityRepresentables = [UserInfoAvailabilityRepresentable(with: userDetails.availability.availabilities)]
    }
    
    init() {
        self.aboutRepresentables = []
        self.experienceRepresentables = []
        self.skillsRepresentables = []
        self.availabilityRepresentables = []
        self.headerRepresentable = HeaderViewRepresentable(alpha:0)
    }
    
    func setAlpha(with alpha: CGFloat) {
        self.headerRepresentable.alpha = alpha
    }
    
    func toggleExpandedInAboutRepresentable(for indexPath: IndexPath) {
        guard let representable = self.representableForRow(at: indexPath) as? UserInfoAboutRepresentable else {
            return
        }
        representable.isExpanded.toggle()
    }
    
    func sortSkillsAccordingToLength(skills: [Skill], width: CGFloat) {
        self.skillsRepresentables = []
        
        let font = UIFont(name: "OpenSans-Light", size: 13)
        
        
        let maxWidth = width - 80
        
        var usedItems: [Int] = []
        let sorted = skills.sorted(by: {(skill1, skill2) -> Bool in
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
    
        self.skillsRepresentables.append(UserInfoSkillsRepresentable(with: toPresent))

    }
    
    func numberOfSections() -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        switch section {
        case 0:
            return aboutRepresentables.count
        case 1:
            return experienceRepresentables.count
        case 2:
            return skillsRepresentables.count
        case 3:
            return availabilityRepresentables.count
        default:
            return 0
        }
    }
    
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        switch indexPath.section {
        case 0:
            return self.aboutRepresentables[indexPath.row].cellHeight
        case 1:
            return self.experienceRepresentables[indexPath.row].cellHeight
        case 2:
            return self.skillsRepresentables[indexPath.row].cellHeight
        case 3:
            return self.availabilityRepresentables[indexPath.row].cellHeight
        default:
            return 0
        }
    }
    
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        switch indexPath.section {
        case 0:
            return self.aboutRepresentables[indexPath.row]
        case 1:
            return self.experienceRepresentables[indexPath.row]
        case 2:
            return self.skillsRepresentables[indexPath.row]
        case 3:
            return self.availabilityRepresentables[indexPath.row]
        default:
            return nil
        }
    }
    
    
}
