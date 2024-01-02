//
//  UIApplication+.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

extension UIApplication {
    var window: UIWindow? {
        UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
    }
    
    var statusBarHeight: CGFloat {
        window?.windowScene?.statusBarManager?.statusBarFrame.height ?? .zero
    }
    
    var safeAreaInsets: UIEdgeInsets {
        window?.safeAreaInsets ?? .zero
    }
}
