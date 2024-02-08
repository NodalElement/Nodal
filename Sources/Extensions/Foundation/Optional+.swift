//
//  Optional+.swift
//  Nodal
//
//  Created by Павел Заварин on 08.02.2024.
//

import Foundation

extension Optional {
    /// Имеет ли переменная значение?
    var isSome: Bool { self != nil }

    /// Переменная не имеет значения?
    var isNone: Bool { self == nil }
}
