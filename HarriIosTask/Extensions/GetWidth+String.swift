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
        let size = CGSize(width: widthLimit, height: 40)
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        let finishSize = CGSize(width: min(textRect.width + 40, widthLimit), height: min(textRect.height + 15, 33))
        
        return finishSize.width
    }
}

