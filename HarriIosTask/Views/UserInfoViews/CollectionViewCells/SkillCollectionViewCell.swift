//
//  SkillCollectionViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTitle()
    }

    func setupTitle(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 5
    }
    
    func setupCell(with representable: UserInfoSkillsRepresentable){
        self.label.text = representable.skillName ?? ""
    }
    
    static func getReuseIdentifier() -> String{
        return "SkillCollectionViewCell"
    }
}
