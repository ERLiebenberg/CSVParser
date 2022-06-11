//
//  ViewModelTests.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import XCTest

@testable import CSVParser

class ViewModelTests: XCTestCase {

    var serviceUnderTest: ViewModel!
    
    override func setUp() {
        super.setUp()
        
        serviceUnderTest = ViewModel()
    }
    
    func testServiceUnderTestIsNotNil() {
        XCTAssertNotNil(serviceUnderTest)
    }
    
    func testItemsCount() {
        XCTAssertEqual(1, serviceUnderTest.itemsCount())
    }

    func testItemsCountWithInvalidIndex() {
        XCTAssertNil(serviceUnderTest.item(at: 999))
    }
    
    func testItemsCountWithValidIndex() {
        let expected = Item(firstName: "name", surname: "surname", issueCount: "count", dateOfBirth: "date")
        let actual = serviceUnderTest.item(at: 0)
        
        XCTAssertEqual(expected, actual)
    }

}
