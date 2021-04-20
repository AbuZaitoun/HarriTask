//
//  HeaderView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit
import JNAvatarWithInitials

class HeaderView: UIView {
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet var view: UIView!

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profilePicture: JNAvatarWithInitials!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var backgroundPicture: JNAvatarWithInitials!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        self.widthConstraint.constant = UIScreen.main.bounds.size.width
        self.addSubview(view)
        self.setupProfilePicture()
        self.setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
    }

    func setupView(with representable: UserInfoHeaderRepresentable) {
        self.nameLabel.text = representable.name
        self.positionLabel.text = representable.position
        self.profilePicture.setup(imageUrl: representable.profilePictureURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: representable.name, showInitails: true)
        self.backgroundPicture.setup(imageUrl: representable.backgroundPictureURL ?? "",placeHolderImage: UIImage(named: "squirrel.jpeg"), fullName: "")
    }
    
    private func setupProfilePicture() {
        self.profilePicture.layer.cornerRadius = self.profilePicture.frame.size.height/2
        self.profilePicture.layer.borderWidth = 1
        self.profilePicture.layer.borderColor = UIColor.white.cgColor
        self.profilePicture.initialsFont = UIFont(name: "OpenSans-SemiBold", size: 14)!
        self.profilePicture.initialTextColor = UIColor(named: "AccentColor")!
        self.profilePicture.initialLabelInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    private func setupButtons() {
        self.editButton.layer.cornerRadius = self.editButton.frame.size.height/2
        self.sendButton.layer.cornerRadius = self.sendButton.frame.size.height/2
        self.editButton.backgroundColor = .white
        self.sendButton.backgroundColor = .white
    }
}
