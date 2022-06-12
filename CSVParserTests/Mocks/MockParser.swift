//
//  MockParser.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/12.
//

import Foundation

@testable import CSVParser

class MockParser: CSVParser {
    
    private(set) var actualPath: String?
    private var records: [[String]]?
    private var error: Error?

    func expectParse(records: [[String]]?, error: Error?) {
        self.records = records
        self.error = error
    }
    
    func parse(path: String, result: @escaping ([[String]]?, Error?) -> ()) {
        actualPath = path
        result(records, error)
    }
    
}
