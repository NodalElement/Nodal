//
//  UIStackView+.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

extension UIStackView {
    /// Добавление UIView с пользовательским интервалом после него
    /// - Parameters:
    ///   - arrangedSubview: UIView
    ///   - withCustomSpacing: Интервал после UIView
    func add(_ arrangedSubview: UIView, withCustomSpacing spacing: CGFloat = .zero) {
        addArrangedSubview(arrangedSubview)
        setCustomSpacing(spacing, after: arrangedSubview)
    }
}
