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
        let height = CGFloat((1+self.numberOfItems(inSection: 0))*6)
        size.height += (height + 3)
        
        return size
    }
    
    
}
