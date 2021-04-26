//
//  Combinations+Array.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 25/04/2021.
//

import Foundation

extension Array {
    var combinationsWithoutRepetition: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    }
 
}
