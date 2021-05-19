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
    
    /// User
    private(set) var user: User?
    
    /// User info view model
    private(set) var infoViewModel: UserInfoViewModel!
    
    /// Alpha
    private(set) var alpha: CGFloat?
    
    
    /**
     View did lead
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView = HeaderView(view: self.view)
        self.initializeViewModels()
        self.setupTableView()
        self.setupTableViewHeaderView()
        self.setupHeaderView()
        self.requestData()
        self.setupNavigationControllerBarColor()
        self.tableView.isSkeletonable = true
        self.tableView.showAnimatedGradientSkeleton()
    }
    /** Place navigation bar
     
     */
    func placeNavigationBar(){
        
        //Create navigation item for presenting content
        let item = UINavigationItem()
        
        //Create an imageview to display image
        let title = UILabel()
        title.text = "test test"
        title.font = self.navbarFont
        title.textColor = self.harriBlue
        
        //Set imageview to newly created navigation item
        item.titleView = title
        let navigationBar = UINavigationBar()
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = self.whiteColor.withAlphaComponent(0)
        
        //Add it to viewcontroller's view and set it's constraints
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.backgroundColor = self.whiteColor.withAlphaComponent(0)
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor: self.harriBlue]
        navigationBar.tintColor = self.whiteColor.withAlphaComponent(1)
        
        navigationBar.items = [item]
    }
    
    /** View will appear
     - Parameter animated: Boolean
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.clipsToBounds = false
        self.setNavbarTransculent()
    }
    
    /** View did appear
     - Parameter animated: Boolean
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.layer.zPosition = 1
    }
    
    /** View will disappear
     - Parameter animated: Boolean
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "AccentColor")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.layer.zPosition = -1
    }
    
    /** Request data
     
     */
    private func requestData() {
        UsersModel.fetchUserInfo(userID: String(self.user?.id ?? -1), completion: { [weak self] (userDetails, error) in
            guard let self = self else { return }
            
            self.user?.backgroundImageUUID = userDetails?.backgroundImage
            self.user?.userDetails = userDetails
            
            self.infoViewModel = UserInfoViewModel(with: self.user, width: self.tableView.bounds.width)
            
            self.tableView.stopSkeletonAnimation()
            self.view.updateSkeleton()
            self.view.hideSkeleton()
            self.view.stopSkeletonAnimation()
            self.tableView.updateSkeleton()
            self.tableView.hideSkeleton()
            self.tableView.stopSkeletonAnimation()
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.tableViewHeaderView.setupView(with: self?.infoViewModel.tableViewHeaderRepresentable ?? UserInfoTableViewHeaderRepresentable(with: User()))
                
            }
            
        })
    }
    
    /** Setup table view
     
     */
    private func setupTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = UIColor(named: "BackgroundColor")
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.extendedLayoutIncludesOpaqueBars = true
        self.tableView.tableHeaderView = tableViewHeaderView
    }
    
    private func setupNavigationControllerBarColor(){
        self.navigationController?.navigationBar.backgroundColor = self.whiteColor.withAlphaComponent(0)
        self.navigationController?.navigationBar.tintColor = self.whiteColor.withAlphaComponent(1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor: self.harriBlue]
        self.title = ""
    }
    
    /** Initialize view models
     
     */
    private func initializeViewModels() {
        self.infoViewModel = UserInfoViewModel()
    }
    
    /** Setup view controller
     - Parameter user: User
     */
    func setupViewController(user: User?){
        if let user = user {
            self.user = user
        }
    }
    
    /** Set up header view
     
     */
    func setupTableViewHeaderView(){
        self.navigationController?.navigationBar.tintColor = self.whiteColor.withAlphaComponent(1)
        self.navigationController?.navigationBar.backgroundColor = self.whiteColor.withAlphaComponent(0)
    }
    
    /** Setup header view
     
     */
    private func setupHeaderView() {
        var heightOfSafeArea: CGFloat = 0
        
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
        headerView.heightAnchor.constraint(equalToConstant: heightOfSafeArea + ((self.navigationController?.navigationBar.frame.size.height) ?? CGFloat(0))).isActive = true
    }
    
    
    /** Set up navigation bar transculent
     
     */
    private func setNavbarTransculent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    /** Set up navitation bar background color
     - Parameter alpha: Alpha
     */
    func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        self.alpha = alpha
        if alpha > 0.5 {
            UIView.animate(withDuration: 0.6) { [weak self] in
                guard let self = self else { return }
                self.navigationController?.navigationBar.tintColor = self.harriBlue
                self.title = self.user?.fullName
                self.navigationController?.navigationBar.barStyle = .default
                self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
            }
        } else {
            UIView.animate(withDuration: 0.6) { [weak self] in
                guard let self = self else { return }
                self.navigationController?.navigationBar.tintColor = self.whiteColor
                self.title = ""
                self.navigationController?.navigationBar.barStyle = .black
                self.navigationController?.navigationBar.layer.shadowOpacity = 0
            }
        }
        
        self.infoViewModel.setAlpha(with: alpha)
        self.headerView.setup(with: infoViewModel.headerRepresentable)
    }
    
}
