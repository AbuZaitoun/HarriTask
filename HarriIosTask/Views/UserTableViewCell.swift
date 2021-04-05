//
//  UserTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import JNAvatarWithInitials

class UserTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var profilePicture: JNAvatarWithInitials!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with: User){
        self.nameLabel.text = with.fullName
        self.jobLabel.text = with.positionText
        self.locationLabel.text = with.locationText
        self.profilePicture.setup(imageUrl: with.imageURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: with.fullName)
    }

}
