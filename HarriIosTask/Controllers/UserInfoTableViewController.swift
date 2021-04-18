//
//  UserInfoTableViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private var userID: String?
    private var aboutViewModel: UserInfoAboutViewModel!
    private var experienceViewModel: UserInfoExperienceViewModel!
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutViewModel = UserInfoAboutViewModel(userInfo: UserInfo(about: ""))
        self.experienceViewModel = UserInfoExperienceViewModel(with: [])
        
        UsersModel.fetchUserInfo(userID: userID ?? "", completion: {[weak self] (userDetails, error) in
            guard let self = self else { return }
            self.aboutViewModel = UserInfoAboutViewModel(userInfo: userDetails?.userInfo ?? UserInfo(about: ""))
            self.experienceViewModel = UserInfoExperienceViewModel(with: userDetails?.experience ?? [])
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
            
        default:
            return UITableViewCell()
        }
        
    }
}
