//
//  UserInfoAboutTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info About Cell Delegate
protocol UserInfoAboutCellDelegate: AnyObject {
    
    /// Label Clicked
    /// - Parameter indexPath: IndexPath
    func labelClicked(indexPath: IndexPath)
}

/// User Info About Table View Cell
class UserInfoAboutTableViewCell: UITableViewCell {
    
    /// About label
    @IBOutlet var aboutLabel: UILabel!
    
    /// Delegate
    weak var delegate: UserInfoAboutCellDelegate?
    
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
    func setupCell(with representable: UserInfoAboutRepresentable, shouldExpand: Bool){
        self.aboutLabel.text = representable.aboutText
        let maxNumberOfLine = self.aboutLabel.maxNumberOfLines
        let numOfLines = self.aboutLabel.numberOfLines
        if shouldExpand {
            DispatchQueue.main.async {
                self.aboutLabel.numberOfLines = maxNumberOfLine
                self.setNeedsLayout()
                self.layoutIfNeeded()
            }
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
    static func getReuseModifier() -> String {
        return "UserInfoAboutTableViewCell"
    }
}
