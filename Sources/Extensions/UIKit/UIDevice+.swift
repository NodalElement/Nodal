//
//  UIDevice+.swift
//  Nodal
//
//  Created by Павел Заварин on 06.02.2024.
//

import UIKit

extension UIDevice {
    static var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case ...1136: return .tiny
        case 1136...1334: return .small
        default: return .large
        }
    }

    /// iPhone XR+ или iPhone Plus
    static var isLarge: Bool { screenType == .large }

    /// iPhone SE
    static var isTiny: Bool { screenType == .tiny }
}

// MARK: - Nested Types

extension UIDevice {
    enum ScreenType: String {
        /// iPhone SE
        case tiny
        /// iPhone 6, 7, 8
        case small
        /// iPhone XR+ или iPhone Plus
        case large
    }
}
