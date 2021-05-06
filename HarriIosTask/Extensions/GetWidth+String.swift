//
//  GetWidth+UILabel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 24/04/2021.
//

import Foundation
import UIKit

/// String
extension String {
    
    
    /**
     label width
     - Parameters:
       - font: UIFont
       - widthLimit: CGFloat
     - Returns: CGFloat, width of label
     */
    func labelWidth(for font: UIFont, widthLimit: CGFloat) -> CGFloat{
        let cellWord = self
        let size = CGSize(width: widthLimit, height: 33)
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width + 40, widthLimit), height: min(textRect.height + 15, 33))
        
        return finishSize.width
    }
    /**
     label height
     - Parameters:
       - font: UIFont
       - widthLimit: CGFloat
     - Returns: CGFloat, height of label
     */
    func labelHeight(for font: UIFont, widthLimit: CGFloat) -> CGFloat {
        let cellWord = self
        let size = CGSize(width: widthLimit, height: 33)
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width + 40, widthLimit), height: min(textRect.height + 10, 33))
        
        return finishSize.height
    }
    
    /**
     label size
     - Parameters:
       - font: UIFont
       - widthLimit: CGFloat
     - Returns: CGSize, size of label
     */
    func labelSize(for font: UIFont, widthLimit: CGFloat) -> CGSize {
        let cellWord = self
        let size = CGSize(width: widthLimit, height: 40)
        // truncatesLastVisibleLine is also a viable option
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width, widthLimit - 50), height: 25)
        
        return finishSize
    }
}

