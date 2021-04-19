//
//  UserInfoAboutViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 17/04/2021.
//

import UIKit

class UserInfoAboutViewModel: ViewModel {
    
    private let NUMBER_OF_SECTIONS = 1
    var userInfo: UserInfo
    var representables: [UserInfoAboutRepresentable]
    
    init(userInfo: UserInfo){
        self.userInfo = userInfo
        self.representables = []
        self.setupRepresentable()
    }
    
    private func setupRepresentable(){
        self.representables = [UserInfoAboutRepresentable(with: self.userInfo)]
    }
    
    func numberOfSections() -> Int {
        return self.NUMBER_OF_SECTIONS
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return self.representables.count
    }
    
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        return self.representables[indexPath.row].cellHeight
    }
    
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return self.representables[indexPath.row]
    }
}
