//
//  UserInfoTableViewController+UITableView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 20/04/2021.
//

import UIKit

/// User Info Table View Controller
extension UserInfoTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    /** Number of sections
     - Parameter tableView: UITableView
     - Returns: Integer, number of sections in tableView
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    /** Number of rows in section
     - Parameters:
       - tableView: UITableView
       - section: Integer, current section
     - Returns: Integer, number of rows in said section
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return self.aboutViewModel.numberOfRows(inSection: section)
        case 1:
            return self.experienceViewModel.numberOfRows(inSection: section)
        case 2:
            return self.skillsViewModel.numberOfRows(inSection: section)
        case 3:
            return self.availabilityViewModel.numberOfRows(inSection: section)
        default:
            return 0
        }
    }
    
    /** Title for header in section
     - Parameters:
       - tableView: UITableView
       - section: Integer, current section
     - Returns: String, header of section
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeaders[section]
    }
    
    /** Cell for row
     - Parameters:
       - tableView: UITableView
       - indexPath: IndexPath for needed cell
     - Returns: UITableViewCell, cell in provided indexpath
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let representable = aboutViewModel.representableForRow(at: indexPath) as? UserInfoAboutRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoAboutTableViewCell.getReuseModifier(), for: indexPath) as? UserInfoAboutTableViewCell
            cell?.setupCell(with: representable, shouldExpand: false)
            cell?.delegate = self
            return cell ?? UITableViewCell()
            
        case 1:
            guard let representable = experienceViewModel.representableForRow(at: indexPath) as? UserInfoExperienceRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoExperienceTableViewCell.getReuseModifier(), for: indexPath) as? UserInfoExperienceTableViewCell
            cell?.setupCell(with: representable)
            return cell ?? UITableViewCell()
            
        case 2:
            guard let representable = skillsViewModel.representableForRow(at: indexPath) as? UserInfoSkillsRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoSkillsTableViewCell.getReuseModifier(), for: indexPath) as? UserInfoSkillsTableViewCell
            cell?.setupCell(with: representable)
            return cell ?? UITableViewCell()
            
        case 3:
            guard let representable = availabilityViewModel.representableForRow(at: indexPath) as? UserInfoAvailabilityRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoAvailabilityTableViewCell.getReuseModifier(), for: indexPath) as? UserInfoAvailabilityTableViewCell
            cell?.setupCell(with: representable)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    /** View for header in section
     - Parameters:
       - tableView: UITableView
       - section: Integer, target section
     - Returns: UIView, optional, view to be presented as section header
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = self.sectionHeaders[section]
        headerLabel.font = UIFont(name: "OpenSans-Regular", size: 16)
        headerLabel.textColor = UIColor.black
        headerLabel.textAlignment = .center
        return headerLabel
    }
    
    
    /** Scroll view did scroll
     - Parameter scrollView: UIScrollView
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let denominator: CGFloat = 250 
        let alpha = min(1, scrollView.contentOffset.y / denominator)
        self.setNavbar(backgroundColorAlpha: alpha)
    }
    
    /** Did select row at
     - Parameters:
       - tableView: UITableView
       - indexPath: IndexPath
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.labelClicked(indexPath: indexPath)
        }
    }
}

