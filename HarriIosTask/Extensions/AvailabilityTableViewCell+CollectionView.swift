//
//  AvailabilityTableViewCell+CollectionView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

extension UserInfoAvailabilityTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.availabilityViewModel.numberOfItemsInSection(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mycell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailabilityCollectionViewCell.getReuseIdentifier(), for: indexPath) as! AvailabilityCollectionViewCell
        guard let representable = availabilityViewModel.representableForCollection(at: indexPath) as? UserInfoAvailabilityRepresentable else {
            return mycell
        }
        mycell.setupCell(with: representable)
        return mycell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let representable = availabilityViewModel.representableForCollection(at: indexPath) as? UserInfoAvailabilityRepresentable else {
            return CGSize()
        }
        let cellWord = representable.availableText ?? "h"
        let font = UIFont(name: "OpenSans-Light", size: 13)
        let size = CGSize(width: UIScreen.main.bounds.width, height: 25)
        
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font!], context: nil)
        
        return CGSize(width: textRect.width + 20, height: 25)
    }
}
