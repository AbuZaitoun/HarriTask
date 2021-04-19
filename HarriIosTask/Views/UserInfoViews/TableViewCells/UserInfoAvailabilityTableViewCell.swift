//
//  UserInfoAvailabilityTableViewCell.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 16/04/2021.
//

import UIKit

class UserInfoAvailabilityTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet var collectionView: UICollectionView!
    var availabilityViewModel: UserInfoAvailabilityViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollectionView()
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

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
        let font = UIFont(name: "OpenSans-Regular", size: 13)
        let size = CGSize(width: UIScreen.main.bounds.width, height: 26)
        
        let textRect = cellWord.boundingRect(with: size,
                                             options: [.usesLineFragmentOrigin],
                                             attributes: [NSAttributedString.Key.font: font],
                                             context: nil)
        
        return CGSize(width: textRect.width + 10,
                      height: textRect.height + 2)
    }
}
