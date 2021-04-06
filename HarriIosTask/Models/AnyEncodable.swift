//
//  AnyEncodable.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 06/04/2021.
//

import Foundation

struct AnyEncodable: Encodable {
    let value: Encodable

    func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }
}
