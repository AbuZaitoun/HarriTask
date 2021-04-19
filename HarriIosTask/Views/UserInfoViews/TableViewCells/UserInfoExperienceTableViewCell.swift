//
//  UserInfoExperienceTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoExperienceTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var positionNameLabel: UILabel!
    @IBOutlet var brandNameLabel: UILabel!
    @IBOutlet var positionDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

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
    static func getReuseModifier() -> String {
        return "UserInfoExperienceTableViewCell"
    }
    
}
