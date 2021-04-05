//
//  ViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    private var userViewModel: UserViewModel!
    private var userNetworkManager: UserNetworkManager!
    var refreshControl = UIRefreshControl()
    var data: [User] = []
    var total = 0
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDelegates()
        self.setupPullToRefresh()
        self.setupNetworkManager()
        
        
        let navbarFont = UIFont(name: "OpenSans-Regular", size: 21)

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navbarFont, NSAttributedString.Key.foregroundColor:UIColor.white]
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
        self.userNetworkManager = UserNetworkManager()
        self.userNetworkManager.fetchUsers(refresh: false, completion: {(users) in
            self.onCompletion(users: users)
        })
    }
    @objc func requestData(){
        self.userNetworkManager.fetchUsers(refresh: true, completion: {(users) in
            self.data = users.all
            self.refreshControl.endRefreshing()
            self.isLoading = false
            self.total = users.hits
            self.mainTableView.reloadData()
        })
    }
    
    func onCompletion(users: Users){
        self.data.append(contentsOf: users.all)
        self.total = users.hits
        self.mainTableView.reloadData()
        self.isLoading = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! UserTableViewCell
            cell.configure(with: UserViewModel(with: data[indexPath.row]))
            return cell
        }else if (self.data.count < self.total){
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
        }else {
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
            self.userNetworkManager.fetchUsers(refresh: false, completion: {(users) in
                self.onCompletion(users: users)
            })
        }
    }
}
