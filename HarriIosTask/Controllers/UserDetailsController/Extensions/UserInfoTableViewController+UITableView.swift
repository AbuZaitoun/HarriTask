//
//  UserInfoTableViewController+UITableView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 20/04/2021.
//

import UIKit
import SkeletonView
/// User Info Table View Controller
extension UserInfoTableViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
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
        
        return self.infoViewModel.numberOfRows(inSection: section)
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
            guard let representable = infoViewModel.representableForRow(at: indexPath) as? UserInfoAboutRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoAboutTableViewCell.getReuseIdentifier(), for: indexPath) as? UserInfoAboutTableViewCell
            cell?.setupCell(with: representable)
            return cell ?? UITableViewCell()
            
        case 1:
            if let representable = infoViewModel.representableForRow(at: indexPath) as? UserInfoExperienceRepresentable {
                let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoExperienceTableViewCell.getReuseIdentifier(), for: indexPath) as? UserInfoExperienceTableViewCell
                cell?.setupCell(with: representable)
                return cell ?? UITableViewCell()
            }
            else if let representable = infoViewModel.representableForRow(at: indexPath) as? ZeroExperienceRepresentable {
                let cell = tableView.dequeueReusableCell(withIdentifier: ZeroExperienceCell.getReuseIdentifier(), for: indexPath) as? ZeroExperienceCell
                cell?.setup(with: representable)
                return cell ?? UITableViewCell()
            }
            else {
                return UITableViewCell()
            }
            
            
        case 2:
            if let representable = infoViewModel.representableForRow(at: indexPath) as? UserInfoSkillsRepresentable {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: SkillsListTableViewCell.getReuseIdentifier(), for: indexPath) as? SkillsListTableViewCell
                cell?.setupCell(with: representable, width: tableView.bounds.width)
                
                return cell ?? UITableViewCell()
            }
            else if let representable = infoViewModel.representableForRow(at: indexPath) as? ZeroExperienceRepresentable {
                let cell = tableView.dequeueReusableCell(withIdentifier: ZeroExperienceCell.getReuseIdentifier(), for: indexPath) as? ZeroExperienceCell
                cell?.setup(with: representable)
                return cell ?? UITableViewCell()
            }
            else {
                return UITableViewCell()
            }
            
        case 3:
            guard let representable = infoViewModel.representableForRow(at: indexPath) as? UserInfoAvailabilityRepresentable else {
                return UITableViewCell()
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoAvailabilityTableViewCell.getReuseIdentifier(), for: indexPath) as? UserInfoAvailabilityTableViewCell
            cell?.setupCell(with: representable, width: tableView.bounds.width)
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
        let denominator: CGFloat = 271
        let alpha = min(1, scrollView.contentOffset.y / denominator)
        
        self.setNavbar(backgroundColorAlpha: alpha)
        
        if let headerView = self.tableView.tableHeaderView as? TableViewHeaderView {
            headerView.scrollViewDidScroll(scrollView: self.tableView)
        }
        
    }
    
    /** Did select row at
     - Parameters:
     - tableView: UITableView
     - indexPath: IndexPath
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.infoViewModel.toggleExpandedInAboutRepresentable(for: indexPath)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
            //            self.labelClicked(indexPath: indexPath)
        }
        else {
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    //MARK: - Skeleton
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        switch indexPath.section {
        case 0:
            return UserInfoAboutTableViewCell.getReuseIdentifier()
        case 1:
            return UserInfoExperienceTableViewCell.getReuseIdentifier()
        case 2:
            return SkillsListTableViewCell.getReuseIdentifier()
        case 3:
            return UserInfoAvailabilityTableViewCell.getReuseIdentifier()
        default:
            return ""
        }
    }
    
    /**
     number of sections
     - Parameter collectionSkeletonView: UITableView
     - Returns int, number of sections
     */
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 4
    }
    
    /**
     number of sections
     - Parameter skeletonView: UITableView
     - Parameter section: Integer
     - Returns int, number of rows in sections
     */
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 1
        }
    }
    
}

