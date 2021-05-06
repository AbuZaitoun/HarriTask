//
//  UserInfoAvailabilityTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info Availability Table View Cell
class UserInfoAvailabilityTableViewCell: UITableViewCell {

    /// Vertical stack
    @IBOutlet weak var verticalStack: UIStackView!
    
    /// awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /**
     Prepare for reuse
     */
    override func prepareForReuse() {
        for view in self.verticalStack.arrangedSubviews {
            self.verticalStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    /** setup cell
     - Parameter representable: UserInfoAvailabilityRepresentable
    */
    func setupCell(with representable: UserInfoAvailabilityRepresentable, width: CGFloat?) {
        self.hideSkeleton()
        let maxWidth = (width ?? CGFloat(400)) - 30
        var remainingWidth = maxWidth
        let padding = (x: CGFloat(11), y: CGFloat(8))
        
        let font = UIFont(name: "OpenSans-Regular", size: 13)!
        var cell: AvailabilityCell
        var labelSize = CGSize()
        
        var horizontalStack = UIStackView()
        horizontalStack.setupStack(with: padding.x)
        var addedToVertical = false
        for availability in representable.availabilities ?? [] {
            labelSize = availability.0.labelSize(for: font, widthLimit: (maxWidth - (padding.x*2)))
            cell = AvailabilityCell(frame: CGRect(x: 0, y: 0, width: labelSize.width + 35, height: labelSize.height))
            cell.setupCell(with: availability.0)
            
            if (labelSize.width + (padding.x*2)) > remainingWidth {
                remainingWidth = maxWidth
                verticalStack.addArrangedSubview(horizontalStack)
                horizontalStack = UIStackView()
                horizontalStack.setupStack(with: padding.x)
                horizontalStack.addArrangedSubview(cell)
                remainingWidth -= ((labelSize.width) + padding.x + 35)
                addedToVertical = true
            } else {
                remainingWidth -= ((labelSize.width) + padding.x + 35)
                horizontalStack.addArrangedSubview(cell)
                addedToVertical = false
            }
        }
        
        if !addedToVertical {
            self.verticalStack.addArrangedSubview(horizontalStack)
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
        return "UserInfoAvailabilityTableViewCell"
    }
    
    
}
