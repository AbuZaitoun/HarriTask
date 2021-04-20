//
//  UserInfoTableViewController+UITableView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 20/04/2021.
//

import UIKit

extension UserInfoTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let representable = aboutViewModel.representableForRow(at: indexPath) as? UserInfoAboutRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoAboutTableViewCell.getReuseModifier(), for: indexPath) as? UserInfoAboutTableViewCell
            cell?.setupCell(with: representable)
            
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = self.sectionHeaders[section]
        headerLabel.font = UIFont(name: "OpenSans-Regular", size: 16)
        headerLabel.textColor = UIColor.black
        headerLabel.textAlignment = .center
        return headerLabel
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let denominator: CGFloat = 250 
        let alpha = min(1, scrollView.contentOffset.y / denominator)
        self.setNavbar(backgroundColorAlpha: alpha)
    }
}

