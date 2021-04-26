//
//  ResizableCollectionView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

/// Resizable Collection View
class ResizableCollectionView: UICollectionView {
    
    /// Reload data
    override func reloadData() {
        super.reloadData()
        
        self.invalidateIntrinsicContentSize()
    }
    
    /// Intrinsic Content size
    override var intrinsicContentSize: CGSize {
        
        var size = self.collectionViewLayout.collectionViewContentSize
        let height = CGFloat((self.numberOfItems(inSection: 0)))
        size.height = size.height + (height)
        
        return size
    }
    
    
}
