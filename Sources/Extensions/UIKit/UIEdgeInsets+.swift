//
//  UIEdgeInsets+.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

enum Spacing {
    /// By default: 16
    static let standard: CGFloat = 16
    /// By default: 8
    static let halfOfStandard: CGFloat = standard / 2
}

extension UIEdgeInsets {
    /// By default: 16
    static var `default` = all(Spacing.standard)

    /// Sets the same `UIEdgeInsets` padding values for all borders
    static func all(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }

    /// Sets the symmetrical indent `UIEdgeInsets` values for horizontal and vertical borders
    static func symmetry(_ horizontal: CGFloat, _ vertical: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    /// Creates a new `UIEdgeInsets` based on an existing one, replacing some values
    func with(
        top: CGFloat? = nil,
        bottom: CGFloat? = nil,
        left: CGFloat? = nil,
        right: CGFloat? = nil
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: top ?? self.top,
            left: left ?? self.left,
            bottom: bottom ?? self.bottom,
            right: right ?? self.right
        )
    }
}
