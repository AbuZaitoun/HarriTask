//
//  setUp+UIStackView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 29/04/2021.
//

import UIKit

extension UIStackView {
    func setupStack(with padding: CGFloat) {
        self.axis = .horizontal
        self.alignment = .leading
        self.distribution = .equalSpacing
        self.spacing = padding
    }
}
