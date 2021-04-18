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
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutViewModel = UserInfoAboutViewModel(userInfo: UserInfo(about: ""))
        UsersModel.fetchUserInfo(userID: userID ?? "", completion: {[weak self] (userDetails, error) in
            guard let self = self else { return }
            self.aboutViewModel = UserInfoAboutViewModel(userInfo: userDetails?.userInfo ?? UserInfo(about: ""))
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
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section != 0 {
            return UITableViewCell()
        }
        guard let representable = aboutViewModel.representableForRow(at: indexPath) else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoAboutTableViewCell.getReuseModifier(), for: indexPath) as? UserInfoAboutTableViewCell
        if let infoRepresetable = representable as? UserInfoAboutRepresentable {
            cell?.setupCell(with: infoRepresetable)
        }
        
        return cell ?? UITableViewCell()
    }
}
