//
//  HeaderView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit
import JNAvatarWithInitials

class TableViewHeaderView: UIView {
    
    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet var view: UIView!

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var profilePicture: JNAvatarWithInitials!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var backgroundPicture: JNAvatarWithInitials!
    
    var imageViewHeight = NSLayoutConstraint()
    var imageViewBottom = NSLayoutConstraint()
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        self.widthConstraint.constant = UIScreen.main.bounds.size.width
        self.viewWidthConstraint.constant = UIScreen.main.bounds.size.width
        self.addSubview(view)
        self.setupProfilePicture()
        self.setupButtons()
        self.clipsToBounds = true
        backgroundPicture.contentMode = .scaleAspectFill
        backgroundPicture.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        
        // Container View Constraints
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.widthAnchor.constraint(equalTo: backgroundPicture.widthAnchor).isActive = true
        
        // ImageView Constraints
        backgroundPicture.translatesAutoresizingMaskIntoConstraints = false
        backgroundPicture.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imageViewBottom = backgroundPicture.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = backgroundPicture.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        imageViewHeight.isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        self.widthConstraint.constant = UIScreen.main.bounds.width
    }

    func setupView(with representable: UserInfoHeaderRepresentable) {
        self.nameLabel.text = representable.name
        self.positionLabel.text = representable.position
        self.profilePicture.setup(imageUrl: representable.profilePictureURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: representable.name, showInitails: true)
        self.backgroundPicture.setup(imageUrl: representable.backgroundPictureURL ?? "",placeHolderImage: UIImage(named: "squirrel.jpeg"), fullName: "")
        self.sendButton.isHidden = false
        self.editButton.isHidden = false
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
        self.editButton.imageView?.bounds = self.editButton.frame
        
        self.editButton.imageView?.contentMode = .scaleToFill
        self.sendButton.imageView?.contentMode = .scaleToFill
        
        let edges = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.editButton.imageEdgeInsets = edges
        self.editButton.contentHorizontalAlignment = .fill
        self.editButton.contentVerticalAlignment = .fill
        self.sendButton.imageEdgeInsets = edges
        self.sendButton.contentHorizontalAlignment = .fill
        self.sendButton.contentVerticalAlignment = .fill
        
        self.sendButton.isHidden = true
        self.editButton.isHidden = true
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top

        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        view.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
    }
}
