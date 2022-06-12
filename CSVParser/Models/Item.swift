//
//  Item.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

enum ItemKey: String, CaseIterable {
    
    case firstName = "First name"
    case surname = "Sur name"
    case issueCount = "Issue count"
    case dateOfBirth = "Date of birth"
    
    static func allCasesAsStrings() -> [String] {
        return allCases.map { $0.rawValue }
    }
}

struct Item: Equatable {
    
    let firstName: String
    let surname: String
    let issueCount: String?
    let dateOfBirth: String?
    
    var dateOfBirthFormatted: String? {
        if let dateOfBirth = dateOfBirth, let date = DateFormatter.UTCFormatter().date(from: dateOfBirth) {
            return date.dayFullMonthYearString()
        }
        
        return nil
    }
    
    init(dictionary: [String: String]) {
        firstName = dictionary[ItemKey.firstName.rawValue] ?? String()
        surname = dictionary[ItemKey.surname.rawValue] ?? String()
        issueCount = dictionary[ItemKey.issueCount.rawValue]
        dateOfBirth = dictionary[ItemKey.dateOfBirth.rawValue]
    }
    
}
