//
//  Double+.swift
//  Nodal
//
//  Created by Павел Заварин on 08.02.2024.
//

import Foundation

extension Double {
    /// - If the price is ``319.92 -> 319.9`` will be displayed.
    /// - If the price is ``319.97 -> 320`` will be displayed.
    func formatting() -> String {
        // Здесь мы сразу сократили 319.93123 до 319.9, чтобы было удобнее работать дальше
        let string = String(format: "%.1f", self)
        guard let double = Double(string) else { return string }

        if double.truncatingRemainder(dividingBy: 1) != .zero {
            return string
        } else {
            return String(format: "%.0f", self)
        }
    }
}
