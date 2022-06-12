//
//  Validator.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

struct Validator {
    
    static func validateKeys(_ keys: [String], expectedKeys: [String]) -> [String]? {
        guard keys.count == expectedKeys.count && keys.sorted() == expectedKeys.sorted() else {
            return nil
        }
        
        return keys
    }
    
    static func validateDictionary(keys: [String], values: [String]) -> [String: String]? {
        guard keys.count == values.count else { return nil }
        
        var dictonary = [String: String]()
        for (index, key) in keys.enumerated() {
            dictonary[key] = values[index]
        }
        return dictonary
    }
    
}
