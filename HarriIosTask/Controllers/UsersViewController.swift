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
    @IBOutlet private var mainTableView: UITableView!
    
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
        self.mainTableView.reloadData()
        self.setTableViewDelegates()
        self.setupPullToRefresh()
        self.setupNavigationTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationTitle()
    }
    
    /**
    setup navigation title
     */
    func setupNavigationTitle(){
        let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.title = "Harri"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "AccentColor")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "AccentColor")
        self.mainTableView.reloadData()
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
        mainTableView.addSubview(refreshControl)
    }
 
    /**
     request data
     */
    @objc func requestData(){
        UsersModel.fetchUsers(start: self.requestStart, size: self.requestSize, completion: { [weak self] (users_result, error) in
            if let users = users_result {
                self?.usersViewModel = UserViewModel(with: users.all, total: users.hits)
            }else {
                self?.handleError(error: error)
            }
            self?.refreshControl.endRefreshing()
            self?.isLoading = false
            self?.mainTableView.reloadData()
        })
    }
    
    /**
     On completion
     - Parameter users: Users
     */
    func onCompletion(users: Users){
        self.isLoading = false
        self.usersViewModel.appendResults(results: users.all, total: users.hits)
        self.mainTableView.reloadData()
        self.requestStart += self.requestSize
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


