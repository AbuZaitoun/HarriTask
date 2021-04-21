//
//  AvailabilityCollectionViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

/// Availability Collection View Cell
class AvailabilityCollectionViewCell: UICollectionViewCell {
    
    /// Label
    @IBOutlet var label: UILabel!
    
    /// awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTitle()
    }
    
    /// setup title
    func setupTitle(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 5
    }
    
    /** setup cell
     - Parameter representable: UserInfoAvailabilityRepresentable
    */
    func setupCell(with representable: UserInfoAvailabilityRepresentable){
        self.label.text = representable.availableText
    }
    
    /** get reuse identifier
     - Returns: String
    */
    static func getReuseIdentifier() -> String{
        return "AvailabilityCollectionViewCell"
    }
}
