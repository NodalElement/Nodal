//
//  User.swift
//  Nodal
//
//  Created by Павел Заварин on 03.01.2024.
//

import Foundation

struct User: Codable {
    var id: String
    var name: String?
    var email: String
    var birthday: Date?
}
