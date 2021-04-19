//
//  CollectionViewModel.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation

protocol CollectionViewModel {
    
    func numberOfItemsInSection(inSection section: Int) -> Int
    
    func representableForCollection(at indexPath: IndexPath) -> TableViewCellRepresentable?
}
