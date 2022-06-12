//
//  ParseError.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

enum ParseError: Error {
    
    case parseIssue
    case invalidKeys
}

extension ParseError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .parseIssue:
            return "Parse issue"
        case .invalidKeys:
            return "Invalid keys"
        }
    }
}
