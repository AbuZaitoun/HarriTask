//
//  SkillCollectionViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// Skill Collection View Cell
class SkillCell: UIView {
    
    /// Label
    @IBOutlet var label: UILabel!
    
    /// Image
    @IBOutlet weak var image: UIImageView!
    
    /**
     Initializer
     - Parameter frame: CGRect
     */
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        Bundle.main.loadNibNamed("SkillCell", owner: self, options: nil)
        
        self.addSubview(label)
        self.addSubview(image)
//        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
        label.leftAnchor.constraint(equalTo: self.image.rightAnchor, constant: 4).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        image.heightAnchor.constraint(equalToConstant: 18).isActive = true
        image.widthAnchor.constraint(equalToConstant: 18).isActive = true
        self.setupTitle()
        
    }
    
    /**
     Initializer
     - Parameter coder: NSCoder
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Awake from nib

     */
    override func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.loadNibNamed("SkillCell", owner: self, options: nil)
        self.setupTitle()
    }
    
    /**
     Setup title
     
     */
    func setupTitle(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "HarriBlue")?.cgColor
        self.layer.cornerRadius = 5
    }
    
    /** Setup cell
     - Parameter representable: UserInfoSkillsRepresentable
    */
    func setupCell(with representable: UserInfoSkillsRepresentable){
        self.label.text = representable.skillName ?? ""
    }
    
    /**
     Setup cell with string
     - Parameter string: CGRect
     */
    func setupCell(with string: String) {
        self.label.text = string
    }
    
}
