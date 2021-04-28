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
    let navbarFont = UIFont(name: "OpenSans-Regular", size: 14)
    
    /// Harri blue
    let harriBlue = UIColor(red: 0.290, green: 0.565, blue: 0.886, alpha: 1)
    
    /// White color
    let whiteColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    /// Header
    let tableViewHeaderView = TableViewHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 271))
    
    /// Section headers
    let sectionHeaders = ["About", "Experience", "Skills", "Availability"]
    
    /// Navbar Like view
    var headerView: HeaderView!
    
    var myCell: SkillsListTableViewCell?
    
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
    
    
    var headerHeightConstraint: NSLayoutConstraint!
    
    /// View did lead
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView = HeaderView(view: self.view)
        self.initializeViewModels()
        self.setupTableView()
        self.setupTableViewHeaderView()
        self.setupHeaderView()
        self.requestData()
        
        self.tableView.isSkeletonable = true
        self.tableView.showSkeleton()
        
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
        self.navigationController?.navigationBar.backgroundColor = self.whiteColor.withAlphaComponent(0)
        self.navigationController?.navigationBar.tintColor = self.whiteColor.withAlphaComponent(1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor: self.harriBlue]
        
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
            self.skillsViewModel = UserInfoSkillsViewModel(with: userDetails?.skills ?? [], width: self.tableView.bounds.width)
            self.availabilityViewModel = UserInfoAvailabilityViewModel(with: userDetails?.availability.availabilities ?? [])
            self.tableHeaderViewModel = UserInfoHeaderViewModel(with: self.user ?? User())
            self.tableViewHeaderView.setupView(with: self.tableHeaderViewModel.representable)
            
            if let representable = self.skillsViewModel.representables[0] as? UserInfoSkillsRepresentable {
                self.myCell = SkillsListTableViewCell()
                self.myCell?.setupCell(with: representable, width: self.tableView.frame.width)
            }
            self.tableView.stopSkeletonAnimation()
            self.view.updateSkeleton()
            self.view.hideSkeleton()
            self.view.stopSkeletonAnimation()
            self.tableView.updateSkeleton()
            self.tableView.hideSkeleton()
            self.tableView.stopSkeletonAnimation()
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
            
        })
    }
    
    /// Set up table view
    private func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = .systemGray5
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.extendedLayoutIncludesOpaqueBars = true;
        
//        self.tableViewHeaderView.clipsToBounds = true
//        self.tableViewHeaderView.imageView.image = UIImage(named: "squirrel")
        
//        tableViewHeaderView.imageView.image = UIImage(named: "squirrel")
        self.tableView.tableHeaderView = tableViewHeaderView
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
        self.navigationController?.navigationBar.tintColor = self.whiteColor.withAlphaComponent(1)
        self.navigationController?.navigationBar.backgroundColor = self.whiteColor.withAlphaComponent(0)
    }
    
    private func setupHeaderView() {
        var heightOfSafeArea: CGFloat = 0
        
//        if #available(iOS 11.0, *) {
//            let window = UIApplication.shared.keyWindow
//            heightOfSafeArea = window?.safeAreaInsets.top ?? 0
//        }
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            heightOfSafeArea = window.safeAreaInsets.top
        }
        
        headerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: heightOfSafeArea).isActive = true
    }
    
    /// Set up navigation bar transculent
    private func setNavbarTransculent() {
        //        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = ""
    }
    
    /** Set up navitation bar background color
     - Parameter alpha: Alpha
     */
    func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        if alpha > 0.5 {
            self.navigationController?.navigationBar.tintColor = self.harriBlue
            self.title = user?.fullName
        } else {
            self.navigationController?.navigationBar.tintColor = self.whiteColor
            self.title = ""
        }
        if alpha == 1 {
            self.navigationController?.navigationBar.isTranslucent = false
        } else {
            self.navigationController?.navigationBar.isTranslucent = true
        }
        self.headerViewModel.setAlpha(with: alpha)
        self.headerView.setup(with: headerViewModel.representable)
        self.navigationController?.navigationBar.backgroundColor = self.whiteColor.withAlphaComponent(alpha)
        self.navigationController?.navigationBar.barTintColor = self.whiteColor.withAlphaComponent(1)
    }
    
}

extension UserInfoTableViewController: HeaderViewDelegate {
    func backButtonAction() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let _ = self.navigationController?.popViewController(animated: true)
    }
}

