//
//  UserInfoTableViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit
import SkeletonView
/// User Info Table View Controller
class UserInfoTableViewController: UIViewController {

    /// Table view
    @IBOutlet weak var tableView: UITableView!
    
    /// Number of sections
    let NUMBER_OF_SECTIONS = 4
    
    /// navigation bar font
    let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)
    
    /// Header
    let tableViewHeaderView = TableViewHeaderView()
    
    /// Section headers
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    
    /// Navbar Like view
    var headerView: HeaderView!
    
    /// User
    private(set) var user: User?
    
    /// User info header view model
    private(set) var tableHeaderViewModel: UserInfoHeaderViewModel!
    
    /// User info about view model
    private(set) var aboutViewModel: UserInfoAboutViewModel!
    
    /// User info experience view model
    private(set) var experienceViewModel: UserInfoExperienceViewModel!
    
    /// User info skills view model
    private(set) var skillsViewModel: UserInfoSkillsViewModel!
    
    /// User info availability view model
    private(set) var availabilityViewModel: UserInfoAvailabilityViewModel!
    
    private(set) var headerViewModel: HeaderViewModel!
    
    /// View did lead
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView = HeaderView(view: self.view)
        
        self.initializeViewModels()
        self.setupTableView()
        self.setupTableViewHeaderView()
        self.setupHeaderView()
        self.requestData()
    }
    
    /** View will appear
     - Parameter animated: Boolean
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.isSkeletonable = true
        self.tableView.showAnimatedGradientSkeleton()
        
        self.setNavbarTransculent()
    }
    
    /** View did appear
     - Parameter animated: Boolean
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
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
            self.skillsViewModel = UserInfoSkillsViewModel(with: userDetails?.skills ?? [], width: 0)
            self.availabilityViewModel = UserInfoAvailabilityViewModel(with: userDetails?.availability.availabilities ?? [])
            self.tableHeaderViewModel = UserInfoHeaderViewModel(with: self.user ?? User())
            self.tableViewHeaderView.setupView(with: self.tableHeaderViewModel.representable)
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
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
        self.skillsViewModel = UserInfoSkillsViewModel(with: [], width: 0)
        self.availabilityViewModel = UserInfoAvailabilityViewModel(with: [])
        self.tableHeaderViewModel = UserInfoHeaderViewModel(with: self.user ?? User())
        self.headerViewModel = HeaderViewModel(with: "", alpha: 0)
        self.headerView.delegate = self
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
    func setupTableViewHeaderView(){
        self.navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        
        self.tableView.tableHeaderView = tableViewHeaderView
//        self.tableView.register(TableViewHeaderView.self,
//               forHeaderFooterViewReuseIdentifier: "Header")
        tableViewHeaderView.translatesAutoresizingMaskIntoConstraints = false
        tableViewHeaderView.leftAnchor.constraint(equalTo: self.tableView.leftAnchor).isActive = true
        tableViewHeaderView.rightAnchor.constraint(equalTo: self.tableView.rightAnchor).isActive = true
        tableViewHeaderView.topAnchor.constraint(equalTo: self.tableView.topAnchor).isActive = true
        tableViewHeaderView.heightAnchor.constraint(equalToConstant: 271).isActive = true
        tableViewHeaderView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.tableView.layoutIfNeeded()
    }
    
    private func setupHeaderView() {
        headerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    /// Set up navigation bar transculent
    private func setNavbarTransculent() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    /** Set up navitation bar background color
     - Parameter alpha: Alpha
    */
    func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        self.headerViewModel.setName(with: user?.fullName ?? "")
        self.headerViewModel.setAlpha(with: alpha)
        self.headerView.setup(with: headerViewModel.representable)
    }

}

extension UserInfoTableViewController: HeaderViewDelegate {
    func backButtonAction() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let _ = self.navigationController?.popViewController(animated: true)
    }
}

