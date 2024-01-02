//
//  UIScrollView+.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import UIKit

extension UIScrollView {
    func setup(
        _ adjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior = .never
    ) -> Self {

        layoutMargins = .zero
        showsVerticalScrollIndicator = false
        keyboardDismissMode = .onDrag
        alwaysBounceVertical = true
        contentInsetAdjustmentBehavior = adjustmentBehavior
        return self
    }
}
