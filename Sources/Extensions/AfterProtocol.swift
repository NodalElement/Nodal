//
//  AfterProtocol.swift
//  Nodal
//
//  Created by Павел Заварин on 02.01.2024.
//

import Foundation

protocol AfterProtocol {
    associatedtype T
    func after(_ after: (T) -> Void) -> T
}

extension AfterProtocol where Self: AnyObject {
    @discardableResult 
    func after(_ after: (Self) -> Void) -> Self {
        after(self)
        return self
    }
}

extension NSObject: AfterProtocol { }
