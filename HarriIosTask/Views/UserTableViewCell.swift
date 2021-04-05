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
    }
    
    func configure(with: UserViewModel){
        self.nameLabel.text = with.name
        self.jobLabel.text = with.positionText
        if with.firstJob ?? false {
            self.locationLabel.text = ""
            self.jobLabel.textColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
            self.jobLabel.font = UIFont(name: "OpenSans-Italic", size: 12)
        }else{
            self.locationLabel.text = with.locationText
            self.jobLabel.font = UIFont(name: "OpenSans-SemiBold", size: 14)
        }
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height/2
        self.profilePicture.setup(imageUrl: with.pictureURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: with.name)
    }

}
