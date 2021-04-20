//
//  UserInfoHeaderViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation

class UserInfoHeaderViewModel {
    var representable: UserInfoHeaderRepresentable
    
    init(with user: User) {
        self.representable = UserInfoHeaderRepresentable(with: user)
    }
}
