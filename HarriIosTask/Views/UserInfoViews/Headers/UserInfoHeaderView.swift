//
//  UserInfoHeaderView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

/// Header View
class HeaderView: UIView {
    
    /// name
//    var name: UILabel
    
    /**
     Initializer
     - Parameter view: UIView
     */
    init(view: UIView){
//        self.name = UILabel()
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(name)
//        self.name.translatesAutoresizingMaskIntoConstraints = false
//        self.name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
//        self.name.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        self.name.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//
//        self.name.font = UIFont(name: "OpenSans-Regular", size: 14)
//        self.name.textColor = UIColor(named: "HarriBlue")
//        self.name.textAlignment = .center
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
//        self.name.text = "Hello :D"
//        self.name.textColor = UIColor(named: "HarriBlue")?.withAlphaComponent(representable.alpha)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
    }
 
}

