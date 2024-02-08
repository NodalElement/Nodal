//
//  UIViewController+.swift
//  Nodal
//
//  Created by Павел Заварин on 08.02.2024.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        frame.flatMap { child.view.frame = $0 }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return  }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
