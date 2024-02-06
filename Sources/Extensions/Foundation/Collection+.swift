//
//  Collection+.swift
//  Nodal
//
//  Created by Павел Заварин on 06.02.2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

    var isNotEmpty: Bool {
        !isEmpty
    }
}
