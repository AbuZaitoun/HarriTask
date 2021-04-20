//
//  UserInfoAboutTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoAboutTableViewCell: UITableViewCell {

    @IBOutlet var aboutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(with representable: UserInfoAboutRepresentable){
        self.aboutLabel.text = representable.aboutText
        let numberOfLine = self.aboutLabel.maxNumberOfLines
//        self.aboutLabel.numberOfLines = numberOfLine
        if  numberOfLine > 5{
            let readmoreFont = UIFont(name: "OpenSans-Regular", size: 13.0)
            let readmoreFontColor = UIColor(named: "HarriBlue")
            DispatchQueue.main.async {
                self.aboutLabel.addTrailing(with: "... ", moreText: "Show More", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor!)
            }
        }
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
        return "UserInfoAboutTableViewCell"
    }
}
