//
//  UserInfoSkillsTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info Skills Table View Cell
class UserInfoSkillsTableViewCell: UITableViewCell {
    
    /// Collection layout
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    /// Collection view
    @IBOutlet var collectionView: UICollectionView!
    
    /// Skills view model
    var skillsViewModel: UserInfoSkillsViewModel!
    
    /// awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.skillsViewModel = UserInfoSkillsViewModel(with: [])
        self.setupCollectionView()
    }
    
    /// Set up collection view
    func setupCollectionView(){
        self.collectionView.isScrollEnabled = false
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    /** Set up cell
     - Parameter representable: UserInfoSkillsRepresentable
    */
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
    static func getReuseIdentifier() -> String {
        return "UserInfoSkillsTableViewCell"
    }
    
}
