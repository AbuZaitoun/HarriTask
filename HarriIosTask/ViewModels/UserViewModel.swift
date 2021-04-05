//
//  UserViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//
import Foundation
class UserViewModel {
    
    private var userAPI: UserAPI!
    private(set) var userData: [User]? {
        didSet {
            self.bindUserViewModelToController()
        }
    }
    
    var bindUserViewModelToController : (() -> ()) = {}

    init() {
        userAPI = UserAPI()
        fetchData()
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    @objc func fetchData(){
        self.userAPI.fetchUsers { (userData) in
            var temp = self.userData
            temp?.append(contentsOf: userData.all)
            self.userData = userData.all
        }
    }
}
