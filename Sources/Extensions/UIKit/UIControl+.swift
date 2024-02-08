//
//  UIControl+.swift
//  Nodal
//
//  Created by Павел Заварин on 08.02.2024.
//

import UIKit

extension UIControl {
    func addAction(for event: UIControl.Event, closure: @escaping (UIControl) -> Void) {
        targetClosure = closure
        addTarget(self, action: #selector(handleAction), for: event)
    }
}

fileprivate extension UIControl {
    final class ClosureWrapper: NSObject {
        let closure: (UIControl) -> Void

        init(_ closure: @escaping (UIControl) -> Void) {
            self.closure = closure
        }
    }

    struct Key {
        static var id: NSString = "TargetClosure"

        static var raw: UnsafeRawPointer {
            UnsafeRawPointer(
                Unmanaged.passUnretained(id).toOpaque()
            )
        }
    }

    var targetClosure: ((UIControl) -> Void)? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, Key.raw) as? ClosureWrapper else { return nil }

            return closureWrapper.closure
        } set {
            guard let newValue else { return }

            objc_setAssociatedObject(self, Key.raw, ClosureWrapper(newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    @objc func handleAction() {
        targetClosure?(self)
    }
}
