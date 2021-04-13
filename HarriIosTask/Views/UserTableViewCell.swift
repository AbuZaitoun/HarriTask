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
    @IBOutlet var detailsLabel: UILabel!
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
    
    func configure(with representable: UserTableViewCellRepresentable){
        self.nameLabel.text = representable.name
        self.detailsLabel.attributedText = representable.detailsText
        self.profilePicture.setup(imageUrl: representable.imageURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: representable.name, showInitails: true)
    }

    static func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    static func getReuseModifier() -> String {
        return "UserTableViewCell"
    }
}
