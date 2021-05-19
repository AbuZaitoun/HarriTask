//
//  ViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import Alamofire

/// Users View Controller
class UsersViewController: UIViewController {
    
    /// Main tableview
    @IBOutlet private(set) var mainTableView: UITableView!
    
    /// Users viewmodel
    private(set) var usersViewModel: UserViewModel!
    
    /// Refresh control
    private var refreshControl = UIRefreshControl()
    
    /// Error
    private var error: Error?
    
    /// Request start
    private(set) var requestStart = 0
    
    /// Is loading
    var isLoading = false
    
    /// User model
    var usersModel: UsersModel!
    
    /// Request size
    let requestSize = 20
    
    /**
     View did load
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usersViewModel = UserViewModel(with: [], total: 1)
        self.setTableViewDelegates()
        self.setupPullToRefresh()
    }
    
    /**
     view did appear
     - Parameter animated: Boolean
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = false
        setupNavigationTitle()
    }
    
    /**
     view will appear
     - Parameter animated: Boolean
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    /**
     setup navigation title
     */
    func setupNavigationTitle(){
        let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.title = "Harri"
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "AccentColor")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "AccentColor")
        
    }
    
    /**
     set tableview delegates
     */
    func setTableViewDelegates() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    /**
     setup pull to refresh
     */
    func setupPullToRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.requestData), for: .valueChanged)
//        mainTableView.addSubview(refreshControl)
        mainTableView.refreshControl = refreshControl
        self.view.layoutIfNeeded()
    }
    
    /**
     request data
     */
    @objc func requestData(){
        UsersModel.fetchUsers(start: 0, size: self.requestSize, completion: { [weak self] (users_result, error) in
            if let users = users_result {
                self?.usersViewModel = UserViewModel(with: users.all, total: users.hits)
            }else {
                self?.handleError(error: error)
            }
//            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                self?.isLoading = false
                self?.mainTableView.reloadData()
//            }
            
        })
    }
    
    /**
     On completion
     - Parameter users: Users
     */
    func onCompletion(users: Users){
//        DispatchQueue.main.async {
            self.isLoading = false
            self.usersViewModel.appendResults(results: users.all, total: users.hits)
            self.mainTableView.reloadData()
            self.requestStart += self.requestSize
//        }
    }
    
    /**
     Handle error
     - Parameter error: Error
     */
    func handleError(error: Error?){
        self.error = error
        if let er = error {
            print(er.asAFError ?? "Something went wrong")
        }
        self.mainTableView.reloadData()
    }
}


public extension UIImage {
    
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage!)!)
    }
    
}
