//
//  UIView+.swift
//  Nodal
//
//  Created by Павел Заварин on 06.02.2024.
//

import UIKit
import SnapKit

extension UIView {
    func addSubview(_ view: UIView, _ closure: (ConstraintMaker) -> Void) {
        addSubview(view)
        view.snp.makeConstraints(closure)
    }

    /// Empty placeholder.
    /// Used in conjunction with (inside) ``UIStackView`` to set the distance between objects.
    static var spacer: UIView {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        return view
    }
}
