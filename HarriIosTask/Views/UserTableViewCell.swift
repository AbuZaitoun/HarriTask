//
//  UserTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabelText(with: String){
        self.nameLabel.text = with
    }
    
    func setLabelsText(with: User){
        self.nameLabel.text = with.fullName
        self.jobLabel.text = with.positionText
        self.locationLabel.text = with.locationText
    }
}
