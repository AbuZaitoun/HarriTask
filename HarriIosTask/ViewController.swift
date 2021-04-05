//
//  ViewController.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    private let URL_STRING = "https://gateway.harridev.com/core/api/v1/harri_search/search_users"
    
    @IBOutlet var mainTableView: UITableView!
    
    private var userViewModel: UserViewModel!
    var refreshControl = UIRefreshControl()
    var data: [User] = []
    var isLoading = false
    var start = 0
    var params: [String: Any]?
    let size = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDelegates()
        self.setupPullToRefresh()
        self.requestData()
        self.callToViewModelForUIUpdate()
    }
    
    func setTableViewDelegates() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    func setupPullToRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.userViewModel.fetchData), for: .valueChanged)
        mainTableView.addSubview(refreshControl)
    }
    func callToViewModelForUIUpdate() {
//        self.userViewModel = UserViewModel()
//        self.userViewModel.bindUserViewModelToController = {
//            self.mainTableView.reloadData()
//        }
    }
    @objc func requestData(){
        if !self.isLoading {
            self.isLoading = true
            
            params = ["size":size, "start":start, "locations":["40.7127753","-74.0059728"]]
            AF.request(URL_STRING, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseDecodable(of: ResponseData.self) { response in
                // TO-DO: Fix retained cycle presented by self
                print(response)
                guard let responseData = response.value
                else {
                    self.refreshControl.endRefreshing()
                    return
                }
                self.data.append(contentsOf: responseData.data.all)
                self.mainTableView.reloadData()
                self.refreshControl.endRefreshing()
                self.isLoading = false
                self.start = self.start + self.size
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! UserTableViewCell
            cell.configure(with: UserViewModel(with: data[indexPath.row]))
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
            cell.activityIndicator.startAnimating()
            return cell
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

            if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
                self.requestData()
            }
        }
}
