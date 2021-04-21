//
//  SkillCollectionViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// Skill Collection View Cell
class SkillCollectionViewCell: UICollectionViewCell {
    
    /// Label
    @IBOutlet var label: UILabel!
    
    /// awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTitle()
    }
    
    /// setup title
    func setupTitle(){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 5
    }
    
    /** Setup cell
     - Parameter representable: UserInfoSkillsRepresentable
    */
    func setupCell(with representable: UserInfoSkillsRepresentable){
        self.label.text = representable.skillName ?? ""
    }
    
    /** get reuse identifier
     - Returns: String
    */
    static func getReuseIdentifier() -> String{
        return "SkillCollectionViewCell"
    }
}
