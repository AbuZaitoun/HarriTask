//
//  ViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import Alamofire

class UsersViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    private var userViewModel: UserViewModel!
    private var usersModel: UsersModel!
    private var refreshControl = UIRefreshControl()
    private var data: [User] = []
    private var total = 0
    private var isLoading = false
    private var error: Error?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDelegates()
        self.setupPullToRefresh()
        self.setupNetworkManager()
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
    
    func setupNetworkManager(){
        self.usersModel = UsersModel.shared
        self.usersModel.fetchUsers(refresh: false, tries: 0, completion: { [weak self] (users_result, error)  in
            if let users = users_result {
                self?.onCompletion(users: users)
            }else {
                self?.handleError(error: error)
            }
        })
    }
    
    @objc func requestData(){
        self.usersModel.fetchUsers(refresh: true, tries: 0, completion: { [weak self] (users_result, error) in
            if let users = users_result {
                self?.data = users.all
                self?.total = users.hits
            }else {
                self?.handleError(error: error)
            }
            self?.refreshControl.endRefreshing()
            self?.isLoading = false
            self?.mainTableView.reloadData()
        })
    }
    
    func onCompletion(users: Users){
        self.data.append(contentsOf: users.all)
        self.total = users.hits
        self.mainTableView.reloadData()
        self.isLoading = false
    }
    
    func handleError(error: Error?){
        self.error = error
        if let er = error {
            print(er.asAFError ?? "Something went wrong")
        } else {
            print("Something went wrong")
        }
        self.mainTableView.reloadData()
//        let alert = UIAlertController(title: "Alert", message: "Something went wrong :(", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! UserTableViewCell
            cell.configure(with: UserViewModel(with: data[indexPath.row]))
            return cell
        } else if (self.data.count < self.total){
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        } else if (self.data.count == 0){
            if let _ = error {
                let cell = UITableViewCell()
                cell.textLabel?.text = "Something went wrong"
                return cell
            }else {
                let loadingCell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
                loadingCell.activityIndicator.startAnimating()
                return loadingCell
            }
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height) && !isLoading && self.data.count < self.total {
            isLoading = true
            self.usersModel.fetchUsers(refresh: false, tries: 0, completion: {(users_result, error) in
                if let users = users_result {
                    self.onCompletion(users: users)
                } else {
                    self.handleError(error: error)
                }
            })
        }
    }
}
