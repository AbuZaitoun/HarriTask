//
//  ResizableCollectionView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import UIKit

class ResizableCollectionView: UICollectionView {
    
    override func reloadData() {
        super.reloadData()
        
        self.invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        
        var size = self.collectionViewLayout.collectionViewContentSize
        let height = CGFloat((1+self.numberOfItems(inSection: 0))*6)
        size.height += (height)
        
        return size
    }
    
    
}
