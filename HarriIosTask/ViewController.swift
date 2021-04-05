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
    var params = ["size":20, "start":0, "locations":["40.7127753","-74.0059728"]] as [String : Any]
    @IBOutlet var mainTableView: UITableView!
    var refreshControl = UIRefreshControl()
    var data: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDelegates()
        self.setupPullToRefresh()
        self.requestData()
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
        print("In")
        AF.request(URL_STRING, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseDecodable(of: ResponseData.self) { response in
            // TO-DO: Fix retained cycle presented by self
            print(response)
            guard let responseData = response.value
            else {
                self.refreshControl.endRefreshing()
                return
            }
            self.data = responseData.data.all
            self.mainTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! UserTableViewCell
        cell.setLabelsText(with: data[indexPath.row])
        return cell
    }

}
