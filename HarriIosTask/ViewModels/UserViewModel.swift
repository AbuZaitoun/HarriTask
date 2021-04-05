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
    var name: String
    var locationText: String
    var positionText: String
    init(with: User) {
        self.name = with.fullName
        self.locationText = with.locationText
        self.positionText = with.positionText
//        userAPI = UserAPI()
//        fetchData()
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
