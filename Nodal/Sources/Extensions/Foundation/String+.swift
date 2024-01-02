//
//  String+.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import Foundation

extension String {
    var isLettersOnly: Bool {
        // If the string contains only allowed characters the function returns nil
        rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }

    var isDigitsOnly: String {
        components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    /// Пустая строка
    ///
    /// Аналог `""`
    static var empty: String { "" }
}
