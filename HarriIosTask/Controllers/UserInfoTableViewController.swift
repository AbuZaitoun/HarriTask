//
//  UserInfoTableViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoTableViewController: UIViewController {
    
    @IBOutlet weak var skillsCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    private var userID: String?
    private var aboutViewModel: UserInfoAboutViewModel!
    private var experienceViewModel: UserInfoExperienceViewModel!
    private var skillsViewModel: UserInfoSkillsViewModel!
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .systemGray5
        self.aboutViewModel = UserInfoAboutViewModel(userInfo: UserInfo(about: ""))
        self.experienceViewModel = UserInfoExperienceViewModel(with: [])
        self.skillsViewModel = UserInfoSkillsViewModel(with: [])
        
        UsersModel.fetchUserInfo(userID: userID ?? "", completion: {[weak self] (userDetails, error) in
            guard let self = self else { return }
            self.aboutViewModel = UserInfoAboutViewModel(userInfo: userDetails?.userInfo ?? UserInfo(about: ""))
            self.experienceViewModel = UserInfoExperienceViewModel(with: userDetails?.experience ?? [])
            self.skillsViewModel = UserInfoSkillsViewModel(with: userDetails?.skills ?? [])
            self.tableView.reloadData()
        })
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setupViewController(userID: String){
        self.userID = userID
    }
    
    // MARK: - Table view data source
    
    
    
}
extension UserInfoTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
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
            
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // constants, should be initialized somewhere else
        switch indexPath.section {
        case 0:
            return self.aboutViewModel.heightForRow(at: indexPath, tableView: tableView)
        case 1:
            return self.experienceViewModel.heightForRow(at: indexPath, tableView: tableView)
        case 2:
            let totalItem: CGFloat = 20
            let totalCellInARow: CGFloat = 3
            let cellHeight: CGFloat = 30
            
            let collViewTopOffset: CGFloat = 10
            let collViewBottomOffset: CGFloat = 10
            
            let minLineSpacing: CGFloat = 5
            
            // calculations
            let totalRow = ceil(totalItem / totalCellInARow)
            let totalTopBottomOffset = collViewTopOffset + collViewBottomOffset
            let totalSpacing = CGFloat(totalRow - 1) * minLineSpacing   // total line space in UICollectionView is (totalRow - 1)
            let totalHeight  = (cellHeight * totalRow) + totalTopBottomOffset + totalSpacing
            
            return totalHeight
        //            return self.skillsViewModel.heightForRow(at: indexPath, tableView: tableView)
        default:
            return CGFloat(0)
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
}
