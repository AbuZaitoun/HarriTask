//
//  AvailabilityCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 02/05/2021.
//

import UIKit

/// Availability Cell
class AvailabilityCell: UIView {
    
    /// Label
    @IBOutlet weak var label: UILabel!
    
    /**
     Initializer
     - Parameter frame: CGRect
     
     */
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AvailabilityCell", owner: self, options: nil)
        self.addSubview(label)
        self.setupTitle()
    }
    
    /**
     Initializer
     - Parameter coder: NSCoder
     
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Setup title
     
     */
    func setupTitle(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        label.font = UIFont(name: "OpenSans-Regular", size: 13)
        label.textColor = UIColor(named: "HarriBlue")
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "HarriBlue")?.cgColor
        self.layer.cornerRadius = 5
    }
    
    /**
     Setup cell with string
     - Parameter string: String
     
     */
    func setupCell(with string: String) {
        self.label.text = string
    }
    
    /**
     Awake from nib
     
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.loadNibNamed("AvailabilityCell", owner: self, options: nil)
        self.setupTitle()
    }
}
