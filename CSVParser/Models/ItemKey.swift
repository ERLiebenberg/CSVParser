//
//  ItemKey.swift
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
