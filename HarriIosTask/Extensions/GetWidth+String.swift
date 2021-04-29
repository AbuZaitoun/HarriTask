//
//  GetWidth+UILabel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 24/04/2021.
//

import Foundation
import UIKit
extension String {
    func labelWidth(for font: UIFont, widthLimit: CGFloat) -> CGFloat{
        let cellWord = self
        let size = CGSize(width: widthLimit, height: 33)
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width + 40, widthLimit), height: min(textRect.height + 15, 33))
        
        return finishSize.width
    }
    
    func labelHeight(for font: UIFont, widthLimit: CGFloat) -> CGFloat {
        let cellWord = self
        let size = CGSize(width: widthLimit, height: 33)
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width + 40, widthLimit), height: min(textRect.height + 10, 33))
        
        return finishSize.height
    }
    
    func labelSize(for font: UIFont, widthLimit: CGFloat) -> CGSize {
        let cellWord = self
        let size = CGSize(width: widthLimit, height: 40)
        // truncatesLastVisibleLine is also a viable option
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width, widthLimit - 50), height: 25)
        
        return finishSize
    }
}

