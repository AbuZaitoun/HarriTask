//
//  UserInfoExperienceRepresentable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import UIKit

/// User Info Expreience Representable
class UserInfoExperienceRepresentable: TableViewCellRepresentable {
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Reuse identifier
    var reuseIdentifier: String
    
    /// Position name
    private(set) var positionName: String
    
    /// Brand name
    private(set) var brandName: String
    
    /// Description
    private(set) var description: String
    
    /// Date text
    private(set) var dateText: String
    
    /** Initializer
     - Parameter work: Work
    */
    init(with work: Work){
        self.description = work.description
        self.cellHeight = UserInfoExperienceTableViewCell.getHeight()
        self.reuseIdentifier = UserInfoExperienceTableViewCell.getReuseIdentifier()
        
        self.brandName = work.brand.name
        if let position = work.position {
            self.positionName = position.name
        } else if let position = work.customPosition {
            self.positionName = position
        } else {
            self.positionName = "Position"
        }
        
        let startString = work.startDateAsDate?.toString()
        
        self.dateText = (startString ?? "Start") + " - " + (work.endDate?.toDate()?.toString() ?? "Current")
        
    }
}
