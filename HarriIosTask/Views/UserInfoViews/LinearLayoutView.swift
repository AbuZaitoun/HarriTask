//
//  LinearLayoutView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 02/05/2021.
//

import UIKit

class LinearLayoutView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var verticalStackView: UIStackView!
    
    init(with skills: [Skill], maxWidth: CGFloat, padding: (x: CGFloat, y: CGFloat)){
        super.init(frame: CGRect())
        Bundle.main.loadNibNamed("LinearLayoutView", owner: self, options: nil)
        self.addSubview(contentView)
//        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Bundle.main.loadNibNamed("LinearLayoutView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setup(with skills: [Skill], maxWidth: CGFloat, padding: (x: CGFloat, y: CGFloat)) {
        
        var remainingWidth = maxWidth
        var horizontalStack = UIStackView()
        horizontalStack.setupStack(with: padding.x)
        
        let font = UIFont(name: "OpenSans-Regular", size: 13)!
        var cell: SkillCell
        var labelSize = CGSize()
        
        for skill in skills {
            labelSize = skill.name.labelSize(for: font, widthLimit: (maxWidth - (padding.x*2)))
            cell = SkillCell(frame: CGRect(x: 0, y: 0, width: labelSize.width + 35, height: labelSize.height))
            cell.setupCell(with: skill.name)
            
            if (labelSize.width + 40 + (padding.x*2)) > remainingWidth {
                remainingWidth = maxWidth
                verticalStackView.addArrangedSubview(horizontalStack)
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
}
