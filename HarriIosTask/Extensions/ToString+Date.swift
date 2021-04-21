//
//  ToString+Date.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

/// Date
extension Date {
    
    /** Convert Date to String
     - Parameter format: String, date format
     - Returns: String, date as string
    */
    func toString(withFormat format: String = "MMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
