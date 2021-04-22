//
//  ZeroExperienceCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

class ZeroExperienceCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(with representable: ZeroExperienceRepresentable) {
        self.label.text = representable.noExperienceText
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
        return "ZeroExperienceCell"
    }
}
