//
//  UserInfoHeaderView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

/// Header View
class HeaderView: UIView {
    
    /**
     Initializer
     - Parameter view: UIView
     */
    init(view: UIView){

        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)

    }
    
    /**
     Initializer
     - Parameter code: NSCoder
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     setup cell with representable
     - Parameter representable: HeaderViewRepresentable
     */
    func setup(with representable: HeaderViewRepresentable) {
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: representable.alpha)
        
    }
 
}

