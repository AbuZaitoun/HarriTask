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
    private var dataSource: UserTableViewDataSource!
    
    @IBOutlet var mainTableView: UITableView!
    
    private var userViewModel: UserViewModel!
    var refreshControl = UIRefreshControl()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPullToRefresh()
        self.callToViewModelForUIUpdate()
    }

    func setupPullToRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.userViewModel.fetchData), for: .valueChanged)
        mainTableView.addSubview(refreshControl)
    }
    func callToViewModelForUIUpdate() {
        self.userViewModel = UserViewModel()
        self.userViewModel.bindUserViewModelToController = {
            self.updateDataSource()
        }
    }

    func updateDataSource(){
        
        self.dataSource = UserTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.userViewModel.userData!, configureCell: { (cell, user) in
            cell.nameLabel.text = user.fullName
            cell.locationLabel.text = user.locationText
        })
        
        DispatchQueue.main.async {
            self.mainTableView.dataSource = self.dataSource
            self.mainTableView.reloadData()
        }
    }
    
}

extension ViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height

            if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
                self.userViewModel.fetchData()
            }
        }
}
