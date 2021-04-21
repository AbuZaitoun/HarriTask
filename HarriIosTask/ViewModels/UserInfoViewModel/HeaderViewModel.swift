//
//  HeaderViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

class HeaderViewModel {
    var representable: HeaderViewRepresentable
    
    init(with name:String, alpha: CGFloat) {
        self.representable = HeaderViewRepresentable(with: name, alpha: alpha)
    }
    
    func setAlpha(with alpha: CGFloat) {
        self.representable.alpha = alpha
    }
    func setName(with name: String) {
        self.representable.name = name
    }
}
