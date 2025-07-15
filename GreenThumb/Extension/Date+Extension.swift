//
//  Date+Extension.swift
//  GreenThumb
//
//  Created by Weerawut Chaiyasomboon on 15/07/2568.
//

import Foundation

extension Date {
    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }
}
