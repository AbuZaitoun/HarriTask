//
//  UserInfoTableViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var user: User?
    private var headerViewModel: UserInfoHeaderViewModel!
    private var aboutViewModel: UserInfoAboutViewModel!
    private var experienceViewModel: UserInfoExperienceViewModel!
    private var skillsViewModel: UserInfoSkillsViewModel!
    private var availabilityViewModel: UserInfoAvailabilityViewModel!
    let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)
    let header = HeaderView()
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .systemGray5
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.aboutViewModel = UserInfoAboutViewModel(userInfo: UserInfo(about: ""))
        self.experienceViewModel = UserInfoExperienceViewModel(with: [])
        self.skillsViewModel = UserInfoSkillsViewModel(with: [])
        self.availabilityViewModel = UserInfoAvailabilityViewModel(with: [])
        self.headerViewModel = UserInfoHeaderViewModel(with: self.user ?? User())
        self.setupHeaderView()
        self.tableView.contentInset.top = 0
        UsersModel.fetchUserInfo(userID: String(self.user?.id ?? -1), completion: {[weak self] (userDetails, error) in
            guard let self = self else { return }
            self.user?.backgroundImageUUID = userDetails?.backgroundImage
            self.aboutViewModel = UserInfoAboutViewModel(userInfo: userDetails?.userInfo ?? UserInfo(about: ""))
            self.experienceViewModel = UserInfoExperienceViewModel(with: userDetails?.experience ?? [])
            self.skillsViewModel = UserInfoSkillsViewModel(with: userDetails?.skills ?? [])
            self.availabilityViewModel = UserInfoAvailabilityViewModel(with: userDetails?.availability.availabilities ?? [])
            self.headerViewModel = UserInfoHeaderViewModel(with: self.user ?? User())
            self.header.setupView(with: self.headerViewModel.representable)
            self.tableView.reloadData()
        })
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func setupViewController(user: User?){
        if let user = user {
            self.user = user
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.barTintColor = .white
//
//        navigationController?.navigationBar.isTranslucent = true
//
        self.setNavbarTransculent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupHeaderView(){
        self.navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.tableView.tableHeaderView = header
        
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leftAnchor.constraint(equalTo: self.tableView.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: self.tableView.rightAnchor).isActive = true
        header.topAnchor.constraint(equalTo: self.tableView.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        header.widthAnchor.constraint(equalToConstant: self.tableView.frame.width).isActive = true
        self.tableView.layoutIfNeeded()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    // MARK: - Table view data source
    private func setNavbarTransculent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let denominator: CGFloat = 250 //your offset treshold
        let alpha = min(1, scrollView.contentOffset.y / denominator)
        self.setNavbar(backgroundColorAlpha: alpha)
    }

    private func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        let newColor = UIColor(red: 1, green: 1, blue: 1, alpha: alpha) //your color
        
        self.navigationController?.navigationBar.backgroundColor = newColor
        if alpha >= 0.5 {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0.47, blue: 1, alpha: alpha)]
            self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.47, blue: 1, alpha: alpha)
            self.navigationController?.navigationBar.barTintColor = newColor
            self.navigationItem.title = self.user?.fullName
        } else {
            self.navigationItem.title = ""
        }
        
        if alpha == 1 {
//            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.47, blue: 1, alpha: 1)
        } else {
//            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
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
}
