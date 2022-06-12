//
//  DateExtension.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

extension Date {
    
    func dayFullMonthYearString() -> String {
        DateFormatter.dayFullMonthYearFormatter().string(from: self)
    }
}
