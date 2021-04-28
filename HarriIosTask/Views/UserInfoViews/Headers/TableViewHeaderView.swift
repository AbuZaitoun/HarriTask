//
//  HeaderView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit
import JNAvatarWithInitials

class TableViewHeaderView: UIView {
    
    
    private var imageWidth: NSLayoutConstraint!
    private var widthConstraint: NSLayoutConstraint!
    
    private var sendButton: UIButton!
    private var editButton: UIButton!
    private var profilePicture: JNAvatarWithInitials!
    private var nameLabel: UILabel!
    private var positionLabel: UILabel!
    private var imageView: JNAvatarWithInitials!
    
    
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView: UIView!
    private var containerViewHeight = NSLayoutConstraint()
    private var imageViewHeight: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView = UIView()
        self.addSubview(containerView)
        
        self.createBackgroundPicture()
        self.setupBackgroundPicture()
        self.createProfilePicture()
        self.setupProfilePictureProperties()
        self.createNameLabel()
        self.setupNameLabelProperties()
        self.createPositionLabel()
        self.setupPositionLabelProperties()
        self.setViewConstraints()
        self.createButtons()
        self.setupButtons()
    }
    
    func setViewConstraints() {
        // UIView Constraints
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            self.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        // Container View Constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        // ImageView Constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        
        //        self.widthConstraint.constant = UIScreen.main.bounds.width
    }
    
    func setupView(with representable: UserInfoHeaderRepresentable) {
        self.nameLabel.text = representable.name
        self.positionLabel.text = representable.position
        self.profilePicture.setup(imageUrl: representable.profilePictureURL ?? "", placeHolderImage: UIImage(named: "squirrel.jpeg") ,fullName: representable.name, showInitails: true)
        self.imageView.setup(imageUrl: representable.backgroundPictureURL ?? "",placeHolderImage: UIImage(named: "squirrel.jpeg"), fullName: "")
        
        self.sendButton.isHidden = false
        self.editButton.isHidden = false
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
    
    private func createProfilePicture(){
        self.profilePicture = JNAvatarWithInitials()
        self.containerView.addSubview(self.profilePicture)
        self.profilePicture.translatesAutoresizingMaskIntoConstraints = false
        self.profilePicture.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 87).isActive = true
        self.profilePicture.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        self.profilePicture.heightAnchor.constraint(equalToConstant: 64).isActive = true
        self.profilePicture.widthAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    private func setupProfilePictureProperties(){
        self.profilePicture.layer.cornerRadius = 32
        self.profilePicture.layer.borderWidth = 2
        self.profilePicture.layer.borderColor = UIColor.white.cgColor
        self.profilePicture.initialsFont = UIFont(name: "OpenSans-SemiBold", size: 14)!
        self.profilePicture.initialTextColor = UIColor(named: "AccentColor")!
        self.profilePicture.initialLabelInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    private func createNameLabel(){
        self.nameLabel = UILabel()
        self.nameLabel.text = ""
        self.containerView.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 163).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    }
    
    private func setupNameLabelProperties(){
        self.nameLabel.textColor = .white
        self.nameLabel.font = UIFont(name: "OpenSans-Regular", size: 20)
    }
    
    private func createPositionLabel(){
        self.positionLabel = UILabel()
        self.positionLabel.text = ""
        self.containerView.addSubview(self.positionLabel)
        self.positionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.positionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        self.positionLabel.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    }
    
    private func setupPositionLabelProperties(){
        self.positionLabel.textColor = .white
        self.positionLabel.font = UIFont(name: "OpenSans-Regular", size: 13)
    }
    
    private func createBackgroundPicture() {
        self.imageView = JNAvatarWithInitials()
        self.containerView.addSubview(self.imageView)
    }
    private func setupBackgroundPicture(){
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = .white
        self.imageView.contentMode = .scaleAspectFill
    }
    
    private func createButtons() {
        let view = UIView()
        self.containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 102).isActive = true
        view.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.positionLabel.bottomAnchor, constant: 11).isActive = true
        
        self.editButton = UIButton()
        self.editButton.setImage(UIImage(named: "EditImage"), for: .normal)
        view.addSubview(editButton)
        self.editButton.translatesAutoresizingMaskIntoConstraints = false
        self.editButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        self.editButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        self.editButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.editButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.editButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.sendButton = UIButton()
        self.sendButton.setImage(UIImage(named: "SendImage"), for: .normal)
        view.addSubview(sendButton)
        self.sendButton.translatesAutoresizingMaskIntoConstraints = false
        self.sendButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        self.sendButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        self.sendButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.sendButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
    
    private func setupButtons(){
        self.editButton.layer.cornerRadius = 21
        self.sendButton.layer.cornerRadius = 21
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
}
