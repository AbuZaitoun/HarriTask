//
//  ToDate+String.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 18/04/2021.
//

import Foundation

/// String
extension String {

    
    /** Convert String to Date with given format
     - Parameter format: String, date format
     - Returns: Date object
    */
    func toDate(withFormat format: String = "EEE, DD MMM yyyy HH:mm:ss zzz") -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date
    }
}

