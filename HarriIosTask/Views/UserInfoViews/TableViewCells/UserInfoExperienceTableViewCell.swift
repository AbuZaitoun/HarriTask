//
//  UserInfoExperienceTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info Experience Table View Cell
class UserInfoExperienceTableViewCell: UITableViewCell {
    
    /// Date label
    @IBOutlet var dateLabel: UILabel!
    
    /// Position name label
    @IBOutlet var positionNameLabel: UILabel!
    
    /// Brand name label
    @IBOutlet var brandNameLabel: UILabel!
    
    /// Position description label
    @IBOutlet var positionDescriptionLabel: UILabel!
    
    /// awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    /** Set up cell
     - Parameter representable: UserInfoExperienceRepresentable
    */
    func setupCell(with representable: UserInfoExperienceRepresentable){
        self.dateLabel.text = representable.dateText
        self.positionNameLabel.text = representable.positionName
        self.brandNameLabel.text = representable.brandName
        self.positionDescriptionLabel.text = representable.description
    }
    
    /**
       Get Height of cell
     - returns height as CGFloat
     */
    static func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Get resuse modifier
     - Returns reuse modifer as String
     */
    static func getReuseIdentifier() -> String {
        return "UserInfoExperienceTableViewCell"
    }
    
}
