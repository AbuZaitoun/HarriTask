//
//  ViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import Alamofire

class UsersViewController: UIViewController {
    
    @IBOutlet private var mainTableView: UITableView!
    private(set) var usersViewModel: UserViewModel!
    private var refreshControl = UIRefreshControl()
    private var error: Error?
    private(set) var requestStart = 0
    var isLoading = false
    var usersModel: UsersModel!
    let requestSize = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usersViewModel = UserViewModel(with: [], total: 1)
        self.mainTableView.reloadData()
        self.setTableViewDelegates()
        self.setupPullToRefresh()
        self.setupNavigationTitle()
    }
    
    func setupNavigationTitle(){
        let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont!, NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    func setTableViewDelegates() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func setupPullToRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.requestData), for: .valueChanged)
        mainTableView.addSubview(refreshControl)
    }
 
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
    
    func onCompletion(users: Users){
        self.isLoading = false
        self.usersViewModel.appendResults(results: users.all, total: users.hits)
        self.mainTableView.reloadData()
        self.requestStart += self.requestSize
    }
    
    func handleError(error: Error?){
        self.error = error
        if let er = error {
            print(er.asAFError ?? "Something went wrong")
        } else {
            print("Something went wrong")
        }
        self.mainTableView.reloadData()
    }
}


