//
//  UserInfoViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 02/05/2021.
//

import UIKit

/// User Info View Model
class UserInfoViewModel: ViewModel {
    
    /// Number  of sections
    var NUMBER_OF_SECTIONS: Int = 4
    
    /// About representables
    var aboutRepresentables: [TableViewCellRepresentable]
    
    /// Experience representables
    var experienceRepresentables: [TableViewCellRepresentable]
    
    /// Skills reprensetables
    var skillsRepresentables: [TableViewCellRepresentable]
    
    /// Availability representables
    var availabilityRepresentables: [TableViewCellRepresentable]
    
    /// Tableview header representable
    var tableViewHeaderRepresentable: UserInfoTableViewHeaderRepresentable?
    
    /// Header representable
    var headerRepresentable: HeaderViewRepresentable
    
    /**
     Initializer
     - Parameter userDetails: object containing all user details
     - Parameter width: CGFloat, width of view of sorting
     */
    convenience init(with user: User?, width: CGFloat){
        self.init()
        guard let user = user else {
            return
        }
        guard let userDetails = user.userDetails else {
            return
        }
        
        self.aboutRepresentables = [UserInfoAboutRepresentable(with: userDetails.userInfo)]
        self.tableViewHeaderRepresentable = UserInfoTableViewHeaderRepresentable(with: user)
        
        for experience in userDetails.experience {
            self.experienceRepresentables.append(UserInfoExperienceRepresentable(with: experience.work))
        }
        if self.experienceRepresentables.isEmpty {
            self.experienceRepresentables.append(ZeroExperienceRepresentable(with: "No experiences to show"))
        }
        if !userDetails.skills.isEmpty {
            self.sortSkillsAccordingToLength(skills: userDetails.skills, width: width)
        } else {
            self.skillsRepresentables.append(ZeroExperienceRepresentable(with: "No skills to show"))
        }
        self.availabilityRepresentables = [UserInfoAvailabilityRepresentable(with: userDetails.availability.availabilities)]
    }
    
    /**
     Initializer
     */
    init() {
        self.aboutRepresentables = []
        self.experienceRepresentables = []
        self.skillsRepresentables = []
        self.availabilityRepresentables = []
        self.headerRepresentable = HeaderViewRepresentable(alpha:0)
    }
    
    /**
     Set alpha, used for header view
     - Parameter alpha: alpha, CGFloat
     */
    func setAlpha(with alpha: CGFloat) {
        self.headerRepresentable.alpha = alpha
    }
    
    /**
     Toggle expanded, used for About Cell
     - Parameter indexPath: Index of cell to expand
     */
    func toggleExpandedInAboutRepresentable(for indexPath: IndexPath) {
        guard let representable = self.representableForRow(at: indexPath) as? UserInfoAboutRepresentable else {
            return
        }
        representable.isExpanded.toggle()
    }
    
    /**
     Sort skills according to text lendth
     - Parameter skills: list of skills to be used
     - Parameter width: CGFloat, width of view of sorting
     */
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
    
    // MARK: - ViewModel Conformance
    
    /**
     Get number of sections
     - Returns: Number of Sections as Int.
     */
    func numberOfSections() -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
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
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
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
    
    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
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
