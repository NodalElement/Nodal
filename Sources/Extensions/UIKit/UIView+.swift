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

    /// Действие, которое произойдет при нажатии на `UIView`
    func addTap(_ action: @escaping () -> Void) {
        tapGesture = action
        isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tapGestureRecognizer)
    }
}

fileprivate extension UIView {
    struct Key {
        static let id: NSString = "TapGestureAction"

        static var raw: UnsafeRawPointer {
            UnsafeRawPointer(
                Unmanaged.passUnretained(id).toOpaque()
            )
        }
    }

    var tapGesture: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, Key.raw) as? () -> Void
        } set {
            guard let newValue else { return }

            objc_setAssociatedObject(self, Key.raw, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        tapGesture?()
    }
}
