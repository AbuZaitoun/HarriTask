//
//  UserInfoHeaderViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation


/// User Info Header View Model
class UserInfoHeaderViewModel {
    
    /// Representables
    var representable: UserInfoHeaderRepresentable
    
    /** Initializer
     - Parameter user: User
    */
    init(with user: User) {
        self.representable = UserInfoHeaderRepresentable(with: user)
    }
}
