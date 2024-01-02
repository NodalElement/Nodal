//
//  CGFloat+.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

extension CGFloat {
    static var width: CGFloat {
        UIApplication.shared.window?.frame.size.width ?? .zero
    }
}
