//
//  LoadingTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 05/04/2021.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    static func getReuseModifier() -> String {
        return "LoadingCell"
    }
}
