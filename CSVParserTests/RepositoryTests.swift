//
//  RepositoryTests.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/12.
//

import XCTest

@testable import CSVParser

class RepositoryTests: XCTestCase {

    private var serviceUnderTest: Repository!
    
    private var mockParser = MockParser()
    
    override func setUp() {
        super.setUp()
        
        serviceUnderTest = RepositoryImplementation(parser: mockParser)
    }
    
    func testLoadItemsPath() {
        let expected = generateUrl()
        
        serviceUnderTest.loadItems(url: expected) { _, _ in }
        
        XCTAssertEqual(expected.path, mockParser.actualPath)
    }
    
    func testLoadItemsFailure() {
        let url = generateUrl()
        let expected = ParseError.parseIssue
        
        mockParser.expectParse(records: nil, error: expected)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertTrue(items.isEmpty)
            XCTAssertEqual(expected, error as? ParseError)
        }
    }
    
    func testLoadItemsWhenRecordsAndErrorIsNil() {
        let url = generateUrl()
        
        mockParser.expectParse(records: nil, error: nil)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertTrue(items.isEmpty)
            XCTAssertNil(error)
        }
    }
    
    func testLoadItemsFailureWhenRecordsAndErrorIsNotNil() {
        let url = generateUrl()
        let expected = ParseError.parseIssue
        
        mockParser.expectParse(records: [], error: expected)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertTrue(items.isEmpty)
            XCTAssertEqual(expected, error as? ParseError)
        }
    }
    
    func testLoadItemsFailureWhenFirstRecordIsNil() {
        let url = generateUrl()
        let expected = ParseError.invalidKeys
        
        mockParser.expectParse(records: [], error: nil)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertTrue(items.isEmpty)
            XCTAssertEqual(expected, error as? ParseError)
        }
    }
    
    func testLoadItemsFailureWithInvalidKeys() {
        let url = generateUrl()
        let expected = ParseError.invalidKeys
        
        mockParser.expectParse(records: [[""]], error: nil)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertTrue(items.isEmpty)
            XCTAssertEqual(expected, error as? ParseError)
        }
    }
    
    func testLoadItemsSuccessWithInvalidValues() {
        let url = generateUrl()
        let records = [ItemKey.allCasesAsStrings(), ["invalid_value"]]
        
        mockParser.expectParse(records: records, error: nil)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertTrue(items.isEmpty)
            XCTAssertNil(error)
        }
    }
    
    func testLoadItemsSuccessWithValidKeysAndValues() {
        let url = generateUrl()
        let records = [ItemKey.allCasesAsStrings(), ["Theo","Jansen","5","1978-01-02T00:00:00"]]
        let expected = [generateItem()]
        
        mockParser.expectParse(records: records, error: nil)
        
        serviceUnderTest.loadItems(url: url) { items, error in
            XCTAssertEqual(expected, items)
            XCTAssertNil(error)
        }
    }

    private func generateUrl() -> URL {
        return URL(fileURLWithPath: "path")
    }
    
    private func generateItem() -> Item {
        let dictionary = [ItemKey.firstName.rawValue: "Theo",
                          ItemKey.surname.rawValue: "Jansen",
                          ItemKey.issueCount.rawValue: "5",
                          ItemKey.dateOfBirth.rawValue: "1978-01-02T00:00:00"]
        
        return Item(dictionary: dictionary)
    }
    
}
