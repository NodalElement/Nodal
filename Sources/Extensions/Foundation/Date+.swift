//
//  Date+.swift
//  Nodal
//
//  Created by Павел Заварин on 06.02.2024.
//

import Foundation

extension Date {
    var year: Int {
        Calendar.current.component(.year, from: self)
    }

    var isDateInToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
