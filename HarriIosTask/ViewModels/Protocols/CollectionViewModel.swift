//
//  CollectionViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation

/// Collection View Model
protocol CollectionViewModel {
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func numberOfItemsInSection(inSection section: Int) -> Int
    
    /** Representable for collection
     - Parameter indexPath: IndexPath
     - Returns: TableViewCellRepresentable
    */
    func representableForCollection(at indexPath: IndexPath) -> TableViewCellRepresentable?
}
