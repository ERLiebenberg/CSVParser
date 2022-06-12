//
//  CSVParserTests.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import XCTest

@testable import CSVParser

enum TestError: Error {
    case missingResource
}

class CSVParserTests: XCTestCase {

    private var serviceUnderTest: CSVParser!
    
    override func setUp() {
        super.setUp()
        
        serviceUnderTest = CSVParserImplemtation()
    }
    
    func testParseFailure() throws {
        let invalid = try generatePath(for: "invalid", type: "jpg")
        let expected = ParseError.parseIssue
        
        let expectation = XCTestExpectation()
        
        serviceUnderTest.parse(path: invalid) { result, error in
            XCTAssertEqual(expected, error as? ParseError)
            XCTAssertNil(result)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testParseSuccess() throws {
        let valid = try generatePath(for: "valid", type: "csv")
        let expected = [["First name", "Sur name", "Issue count", "Date of birth"], ["Theo", "Jansen", "5", "1978-01-02T00:00:00"]]
        
        let expectation = XCTestExpectation()
        serviceUnderTest.parse(path: valid) { result, error in
            XCTAssertEqual(expected, result)
            XCTAssertNil(error)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func generatePath(for resource: String, type: String) throws -> String {
        let bundle = Bundle(for: CSVParserTests.self)
        guard let path = bundle.path(forResource: resource, ofType: type) else {
            throw TestError.missingResource
        }
        
        return path
    }
}
