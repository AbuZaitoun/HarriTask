//
//  UserInfoSkillsTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoSkillsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet var collectionView: UICollectionView!
    var skillsViewModel: UserInfoSkillsViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.skillsViewModel = UserInfoSkillsViewModel(with: [])
        self.setupCollectionView()
    }
    
    func setupCollectionView(){
        if let layout = self.collectionView.collectionViewLayout as? AlignedCollectionViewFlowLayout {
            layout.horizontalAlignment = .left
        }
        self.collectionView.isScrollEnabled = false
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setupCell(with representable: UserInfoSkillsRepresentable) {
        self.skillsViewModel = UserInfoSkillsViewModel(with: representable.skills ?? [])
        self.collectionView.reloadData()
    }
    
    /**
     Get Height of cell
     - returns height as CGFloat
     */
    static func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Get resuse modifier
     - Returns reuse modifer as String
     */
    static func getReuseModifier() -> String {
        return "UserInfoSkillsTableViewCell"
    }
    
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
        let cellWord = representable.skillName ?? "h"
        let font = UIFont(name: "OpenSans-Regular", size: 13)
        let size = CGSize(width: UIScreen.main.bounds.width, height: 26)
        
        let textRect = cellWord.boundingRect(with: size,
                                             options: [.usesLineFragmentOrigin],
                                             attributes: [NSAttributedString.Key.font: font],
                                             context: nil)
        
        return CGSize(width: textRect.width + 8,
                      height: textRect.height + 4)
    }
}
