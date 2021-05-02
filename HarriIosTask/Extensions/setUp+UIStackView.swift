//
//  setUp+UIStackView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 29/04/2021.
//

import UIKit

/// UIStackView
extension UIStackView {
    
    /**
     setup stack view to be horizontal, setup alignment and distribution
     - Parameter padding: CGFloat, spacing between stack's views
     */
    func setupStack(with padding: CGFloat) {
        self.axis = .horizontal
        self.alignment = .leading
        self.distribution = .equalSpacing
        self.spacing = padding
    }
}
