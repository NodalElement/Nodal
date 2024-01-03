//
//  Environment.swift
//  Nodal
//
//  Created by Павел Заварин on 03.01.2024.
//

import Foundation

enum Environment { }

extension Environment {
    enum Variable: String {
        case environmentType = "ENVIRONMENT_TYPE"
        case applicationVersion = "APPLICATION_VERSION"
    }
}

extension Environment {
    static var type: String {
        Bundle.main.object(forInfoDictionaryKey: Variable.environmentType.rawValue) as? String ?? .empty
    }
    static var applicationVersion: String {
        Bundle.main.object(forInfoDictionaryKey: Variable.applicationVersion.rawValue) as? String ?? .empty
    }
}
