//
//  UserInfoAboutTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info About Table View Cell
class UserInfoAboutTableViewCell: UITableViewCell {
    
    /// About label
    @IBOutlet var aboutLabel: UILabel!
    
    /// Awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    
    /** Set selected
     - Parameters:
       - selected: Boolean
       - animated: Boolean
    */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /** Set up cell with representable
     - Parameters:
       - representable: UserInfoAboutRepresentable
       - shouldExpand: Boolean
    */
    func setupCell(with representable: UserInfoAboutRepresentable){
        if let text = representable.aboutText {
            self.aboutLabel.text = text
        } else {
            self.aboutLabel.textAlignment = .center
            self.aboutLabel.font = UIFont(name: "OpenSans-Light", size: 13)
            self.aboutLabel.textColor = .systemGray
            self.aboutLabel.text = representable.noAboutText!
        }
        
        let maxNumberOfLine = self.aboutLabel.maxNumberOfLines
//        let numOfLines = self.aboutLabel.numberOfLines
        if representable.isExpanded {
//            DispatchQueue.main.async {
                self.aboutLabel.numberOfLines = maxNumberOfLine
                self.setNeedsLayout()
                self.layoutIfNeeded()
//            }
        }
        
        if maxNumberOfLine > self.aboutLabel.numberOfLines {
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
    static func getReuseIdentifier() -> String {
        return "UserInfoAboutTableViewCell"
    }
}
