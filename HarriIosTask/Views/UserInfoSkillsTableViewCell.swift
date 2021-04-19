//
//  UserInfoSkillsTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoSkillsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
                collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            }
    }
    @IBOutlet var collectionView: UICollectionView!
    var skillsViewModel: SkillViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.skillsViewModel = SkillViewModel(with: [])
        self.setupCollectionView()
    }

    func setupCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setupCell(with representable: UserInfoSkillsRepresentable){
        self.skillsViewModel = SkillViewModel(with: representable.skills)
        self.collectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        let mycell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillCollectionViewCell", for: indexPath) as! SkillCollectionViewCell
        mycell.setupCell(with: skillsViewModel.representableForRow(at: indexPath))
        return mycell
    }

}

class Constant {
    static let totalItem: CGFloat = 20
    
    static let column: CGFloat = 3
    
    static let minLineSpacing: CGFloat = 1.0
    static let minItemSpacing: CGFloat = 1.0
    
    static let offset: CGFloat = 1.0 // TODO: for each side, define its offset
    
    static func getItemWidth(boundWidth: CGFloat) -> CGFloat {
        
        // totalCellWidth = (collectionview width or tableview width) - (left offset + right offset) - (total space x space width)
        let totalWidth = boundWidth - (offset + offset) - ((column - 1) * minItemSpacing)
        
        return totalWidth / column
    }
}
