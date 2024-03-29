//
//  SkillsListTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 26/04/2021.
//

import UIKit

/// Skills List TableView Cell
class SkillsListTableViewCell: UITableViewCell {
    
    //    @IBOutlet weak var view: UIView!
    @IBOutlet weak var verticalStack: UIStackView!
    
    /**
     Awake from nib
     */
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
    
    /**
     Setup Cell with representable
     - Parameter representable: UserInfoSkillsRepresentable
     - Parameter width: CGFloat
     */
    func setupCell(with representable: UserInfoSkillsRepresentable, width: CGFloat?){
        self.hideSkeleton()
        let maxWidth = (width ?? CGFloat(400)) - 30
        var remainingWidth = maxWidth
        let padding = (x: CGFloat(11), y: CGFloat(8))
        
        let font = UIFont(name: "OpenSans-Regular", size: 13)!
        var cell: SkillCell
        var labelSize = CGSize()
        
        var horizontalStack = UIStackView()
        horizontalStack.setupStack(with: padding.x)
        
        
//        linearLayout.setup(with: representable.skills ?? [], maxWidth: maxWidth, padding: padding)
//        self.setNeedsLayout()
//        self.layoutIfNeeded()
        for skill in representable.skills ?? [] {
            labelSize = skill.name.labelSize(for: font, widthLimit: (maxWidth - (padding.x*2)))
            cell = SkillCell(frame: CGRect(x: 0, y: 0, width: labelSize.width + 35, height: labelSize.height))
            cell.setupCell(with: skill.name)

            if (labelSize.width + 40 + (padding.x*2)) > remainingWidth {
                remainingWidth = maxWidth
                verticalStack.addArrangedSubview(horizontalStack)
                horizontalStack = UIStackView()
                horizontalStack.setupStack(with: padding.x)
                horizontalStack.addArrangedSubview(cell)
                remainingWidth -= ((labelSize.width) + padding.x + 35)
            } else {
                remainingWidth -= ((labelSize.width) + padding.x + 35)
                horizontalStack.addArrangedSubview(cell)
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
        return "SkillsListTableViewCell"
    }
}
