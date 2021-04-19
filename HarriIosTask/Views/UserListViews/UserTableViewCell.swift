//
//  UserTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 04/04/2021.
//

import UIKit
import JNAvatarWithInitials

/// User Table View Cell
class UserTableViewCell: UITableViewCell {

    
    /// Name label
    @IBOutlet var nameLabel: UILabel!
    
    /// Details label
    @IBOutlet var detailsLabel: UILabel!
    
    /// Profile picture
    @IBOutlet var profilePicture: JNAvatarWithInitials!
    
    /** AwakeFromNib
     
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupProfilePicture()
    }

    /** Set Selected
    - Parameter selected: Bool
    - Parameter animated: Bool
     */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /** Setup profile picture
     
     */
    private func setupProfilePicture() {
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height/2
        self.profilePicture.initialsFont = UIFont(name: "OpenSans-SemiBold", size: 14)!
        self.profilePicture.initialTextColor = .white
        self.profilePicture.initialLabelInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    /** Configure
        - Parameter representable: User table view cell representable
     */
    func configure(with representable: UserTableViewCellRepresentable){
        self.nameLabel.text = representable.name
        self.detailsLabel.attributedText = representable.detailsText
        self.profilePicture.setup(imageUrl: representable.imageURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: representable.name, showInitails: true)
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
        return "UserTableViewCell"
    }
}
