//
//  UserInfoHeaderView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

protocol HeaderViewDelegate {
    func backButtonAction()
}

class HeaderView: UIView {
    
    var backButton: UIButton
    var backImage: UIImage
    var nameLabel: UILabel
    var delegate: HeaderViewDelegate?
    
    init(view: UIView){
        self.backButton = UIButton()
        self.backImage = UIImage(named: "BackImage.png")!.withRenderingMode(.alwaysTemplate)
        self.nameLabel = UILabel()
        
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.addSubview(backButton)
        self.addSubview(nameLabel)
        self.setupShadow()
        self.setupBackButton()
        self.setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with representable: HeaderViewRepresentable) {
        let alpha = representable.alpha
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: representable.alpha)
        self.nameLabel.text = representable.name
        self.nameLabel.textColor = UIColor(red: 0, green: 0.47, blue: 1, alpha: alpha)
        if alpha > 0.5 {
            self.backButton.tintColor = UIColor(named: "AccentColor")
        } else {
            self.backButton.tintColor = .white
        }
    }
    
    private func setupShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
    
    private func setupBackButton(){
        self.backButton.setImage(backImage, for: .normal)
        self.backButton.tintColor = .white
        self.backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        self.backButton.setTitle("", for: .normal)
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        self.backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        self.backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 55).isActive = true
    }
    
    private func setupLabel(){
        self.nameLabel.text = ""
        self.nameLabel.font = UIFont(name: "OpenSans-Regular", size: 14)
        self.nameLabel.textColor = UIColor(red: 0, green: 0.47, blue: 1, alpha: 0)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    @objc func backButtonPressed(){
        self.delegate?.backButtonAction()
    }
}

