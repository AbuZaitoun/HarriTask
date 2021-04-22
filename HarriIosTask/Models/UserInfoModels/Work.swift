//
//  Work.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

/// Work
struct Work: Codable {
    
    /// Custom position
    var customPosition: String?
    
    /// Start date
    var startDate: String
    
    /// End date
    var endDate: String?
    
    /// Description
    var description: String
    
    /// Brand
    var brand: Brand
    
    /// Position
    var position: Position?
    
    /// Initializer
    init() {
        self.customPosition = ""
        self.startDate = ""
        self.description = ""
        self.brand = Brand(name: "")
    }
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case customPosition = "custom_position"
        case description = "description"
        case startDate = "start_date"
        case endDate = "end_date"
        case brand = "Brand"
        case position = "Position"
    }
    
    /// Start date as date
    var startDateAsDate: Date? {
        return self.startDate.toDate()
    }
}
