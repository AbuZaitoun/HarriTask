//
//  LoadingTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

import UIKit


/// Loading Table View Cell
class LoadingTableViewCell: UITableViewCell {
    
    /// Activity indicator
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    /** AwakeFromNib
     
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /** Set Selected
    - Parameters selected: Bool
    - Parameters animated: Bool
     */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        return "LoadingCell"
    }
}
