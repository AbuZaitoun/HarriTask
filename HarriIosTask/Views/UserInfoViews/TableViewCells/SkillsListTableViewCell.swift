//
//  SkillsListTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 26/04/2021.
//

import UIKit

class SkillsListTableViewCell: UITableViewCell {
    
    //    @IBOutlet weak var view: UIView!
    @IBOutlet weak var verticalStack: UIStackView!
    
    var view: UIView!
    var previousCell: SkillCollectionViewCell?
    var previousRowCell: SkillCollectionViewCell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func prepareForReuse() {
        for view in self.verticalStack.arrangedSubviews {
            self.verticalStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    func setupCell(with representable: UserInfoSkillsRepresentable, width: CGFloat?){
        let maxWidth = (width ?? CGFloat(400)) - 30
        var remainingWidth = maxWidth
        var yCoordinates = CGFloat(15)
        var xCoordinates = CGFloat(15)
        let padding = (x: CGFloat(11), y: CGFloat(8))
        //        var label = UILabel()
        //        label.text = "Loading"
        //        label.backgroundColor = .red
        //        self.addSubview(label)
        
        //        DispatchQueue.main.async {
        //        self.view = UIView()
        //
        //        self.addSubview(self.view)
        //
        //        self.view.translatesAutoresizingMaskIntoConstraints = false
        //        self.view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        //        self.view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //        self.view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        //        self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //
        //
        let font = UIFont(name: "OpenSans-Regular", size: 13)!
        var cell: SkillCollectionViewCell
        var labelSize = CGSize()
        
        //        for skill in representable.skills! {
        //            labelSize = skill.name.labelSize(for: font, widthLimit: (maxWidth - (padding.x*2)))
        //            if (labelSize.width + 40 + (padding.x*2)) > remainingWidth {
        //                remainingWidth = maxWidth
        //                yCoordinates += (labelSize.height + padding.y)
        //                xCoordinates = CGFloat(15)
        //                cell = SkillCollectionViewCell(frame: CGRect(x: xCoordinates, y: yCoordinates, width: labelSize.width + 35, height: labelSize.height))
        //
        //
        //            } else {
        //                cell = SkillCollectionViewCell(frame: CGRect(x: xCoordinates, y: yCoordinates, width: labelSize.width + 35, height: labelSize.height))
        //            }
        //            cell.setupCell(with: skill.name)
        //            self.view.addSubview(cell)
        //            remainingWidth -= ((labelSize.width) + padding.x + 35)
        //            xCoordinates += (labelSize.width + padding.x + 35)
        //        }
        //        self.view.heightAnchor.constraint(equalToConstant: (yCoordinates + labelSize.height + 15)).isActive = true
        
        
        //        self.view.setNeedsLayout()
        //        self.view.layoutIfNeeded()
        //        self.setNeedsLayout()
        //        self.layoutIfNeeded()
        //                }
        
        
        //               var verticalStack = UIStackView()
        //                verticalStack.alignment = .fill
        //                verticalStack.axis = .vertical
        //                verticalStack.translatesAutoresizingMaskIntoConstraints = false
        //                self.addSubview(verticalStack)
        //                verticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        //                verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        //                verticalStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        //                verticalStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        //                verticalStack.spacing = padding.y
        //                verticalStack.distribution = .equalSpacing
        //
        
        var horizontalStack = UIStackView()
        horizontalStack.setupStack(with: padding.x)
        
        for skill in representable.skills ?? [] {
            labelSize = skill.name.labelSize(for: font, widthLimit: (maxWidth - (padding.x*2)))
            cell = SkillCollectionViewCell(frame: CGRect(x: 0, y: 0, width: labelSize.width + 35, height: labelSize.height))
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
