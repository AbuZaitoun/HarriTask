//
//  UserInfoTableViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info Table View Controller
class UserInfoTableViewController: UIViewController {
    
    /// Table view
    @IBOutlet weak var tableView: UITableView!
    
    /// Number of sections
    let NUMBER_OF_SECTIONS = 4
    
    /// navigation bar font
    let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)
    
    /// Header
    let header = HeaderView()
    
    /// Section headers
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    
    /// User
    private(set) var user: User?
    
    /// User info header view model
    private(set) var headerViewModel: UserInfoHeaderViewModel!
    
    /// User info about view model
    private(set) var aboutViewModel: UserInfoAboutViewModel!
    
    /// User info experience view model
    private(set) var experienceViewModel: UserInfoExperienceViewModel!
    
    /// User info skills view model
    private(set) var skillsViewModel: UserInfoSkillsViewModel!
    
    /// User info availability view model
    private(set) var availabilityViewModel: UserInfoAvailabilityViewModel!
    
    
    /// View did lead
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.initializeViewModels()
        self.setupHeaderView()
        self.requestData()
    }
    
    /** View will appear
     - Parameter animated: Boolean
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavbarTransculent()
    }
    
    /** View did appear
     - Parameter animated: Boolean
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    /** View will disappear
     - Parameter animated: Boolean
    */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    /// Request data
    private func requestData() {
        UsersModel.fetchUserInfo(userID: String(self.user?.id ?? -1), completion: { [weak self] (userDetails, error) in
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
    }
    
    /// Set up table view
    private func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.backgroundColor = .systemGray5
        self.tableView.contentInsetAdjustmentBehavior = .never
    }
    
    /// Initialize view models
    private func initializeViewModels() {
        self.aboutViewModel = UserInfoAboutViewModel(userInfo: UserInfo(about: ""))
        self.experienceViewModel = UserInfoExperienceViewModel(with: [])
        self.skillsViewModel = UserInfoSkillsViewModel(with: [])
        self.availabilityViewModel = UserInfoAvailabilityViewModel(with: [])
        self.headerViewModel = UserInfoHeaderViewModel(with: self.user ?? User())
    }
    
    /** Setup view controller
     - Parameter user: User
    */
    func setupViewController(user: User?){
        if let user = user {
            self.user = user
        }
    }
    
    /// Set up header view
    func setupHeaderView(){
        self.navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        
        self.tableView.tableHeaderView = header
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leftAnchor.constraint(equalTo: self.tableView.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: self.tableView.rightAnchor).isActive = true
        header.topAnchor.constraint(equalTo: self.tableView.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 250).isActive = true
        self.tableView.layoutIfNeeded()
    }
    
    /// Set up navigation bar transculent
    private func setNavbarTransculent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    /** Set up navitation bar background color
     - Parameter alpha: Alpha
    */
    func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        let newColor = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
        self.navigationController?.navigationBar.backgroundColor = newColor
        if alpha >= 0.5 {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0.47, blue: 1, alpha: alpha)]
            self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.47, blue: 1, alpha: alpha)
            self.navigationController?.navigationBar.barTintColor = newColor
            self.navigationItem.title = self.user?.fullName
            if alpha == 1 {
                self.navigationController?.navigationBar.isTranslucent = false
                self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0.47, blue: 1, alpha: 1)
            }
        } else {
            self.navigationItem.title = ""
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

