//
//  SkillsTableViewCell+CollectionView.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 21/04/2021.
//

import UIKit

extension UserInfoSkillsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.skillsViewModel.numberOfItemsInSection(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let mycell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCollectionViewCell.getReuseIdentifier(), for: indexPath) as! SkillCollectionViewCell
        guard let representable = skillsViewModel.representableForCollection(at: indexPath) as? UserInfoSkillsRepresentable else {
            return mycell
        }
        mycell.setupCell(with: representable)
        return mycell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let representable = skillsViewModel.representableForCollection(at: indexPath) as? UserInfoSkillsRepresentable else {
            return CGSize()
        }
        
        
        let cellWord = representable.skillName ?? "Place holder"
        let font = UIFont(name: "OpenSans-Light", size: 13)
        let size = CGSize(width: collectionView.bounds.width - 15, height: 40)
        
        let textRect = cellWord.boundingRect(with: size, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return CGSize(width: min(textRect.width + 40, collectionView.bounds.width - 15), height: min(textRect.height + 15, 33))
    }
    
}
