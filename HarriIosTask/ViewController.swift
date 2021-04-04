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
    var data = ["hello", "two"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewDelegates()
    }
    
    func setTableViewDelegates() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func requestData(){
        AF.request(URL_STRING).validate().responseDecodable(of: User.self) { response in 
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! UserTableViewCell
        cell.setLabelText(with: data[indexPath.row])
        return cell
    }

}
