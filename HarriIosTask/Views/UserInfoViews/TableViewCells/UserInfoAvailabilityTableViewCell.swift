//
//  UserInfoAvailabilityTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

/// User Info Availability Table View Cell
class UserInfoAvailabilityTableViewCell: UITableViewCell {
    
    /// Collection layout
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    /// Collection view
    @IBOutlet var collectionView: UICollectionView!
    
    /// Availability view model
    var availabilityViewModel: UserInfoAvailabilityViewModel!
    
    /// awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollectionView()
    }
    
    /// Setup collection view
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    /** setup cell
     - Parameter representable: UserInfoAvailabilityRepresentable
    */
    func setupCell(with representable: UserInfoAvailabilityRepresentable) {
        self.availabilityViewModel = UserInfoAvailabilityViewModel(with: representable.availabilities ?? [])
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
        return "UserInfoAvailabilityTableViewCell"
    }
    
    
}
