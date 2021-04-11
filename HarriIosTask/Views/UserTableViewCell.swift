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
        self.setupProfilePicture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupProfilePicture() {
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height/2
        self.profilePicture.initialsFont = UIFont(name: "OpenSans-SemiBold", size: 14)!
        self.profilePicture.initialTextColor = .white
        self.profilePicture.initialLabelInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func configure(with model: UserViewModel){
        self.nameLabel.text = model.name
        self.jobLabel.text = model.positionText
        if model.firstJob ?? false {
            self.locationLabel.text = ""
            self.jobLabel.textColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
            self.jobLabel.font = UIFont(name: "OpenSans-Italic", size: 12)
        }else{
            self.locationLabel.text = model.locationText
            self.jobLabel.font = UIFont(name: "OpenSans-SemiBold", size: 14)
        }
        self.profilePicture.setup(imageUrl: model.pictureURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: model.name, showInitails: true)
        
    }

}
