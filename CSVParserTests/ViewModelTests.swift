//
//  ViewModelTests.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import XCTest

@testable import CSVParser

class ViewModelTests: XCTestCase {

    private var serviceUnderTest: ViewModel!
    
    private var mockView = MockView()
    private var mockRepository = MockRepository()
    
    override func setUp() {
        super.setUp()
        
        serviceUnderTest = ViewModel(view: mockView, repository: mockRepository)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockView.verify()
    }
    
    func testServiceUnderTestIsNotNil() {
        XCTAssertNotNil(serviceUnderTest)
    }
    
    func testItemsCount() {
        XCTAssertEqual(0, serviceUnderTest.itemsCount())
    }

    func testItemsCountWithInvalidIndex() {
        XCTAssertNil(serviceUnderTest.item(at: 999))
    }

    func testLoadItemsUrl() {
        let expected = generateUrl()
        
        mockView.expectHandleLoadingStart(1)
        mockView.expectReload(1)
        mockView.expectHandleLoadingStop(1)
        mockRepository.expectLoadItems(items: [], error: ParseError.parseIssue)
        
        serviceUnderTest.loadFile(url: expected)
        
        XCTAssertEqual(expected, mockRepository.actualUrl)
    }
    
    func testLoadItemsFailure() {
        let expected = ParseError.parseIssue
        let url = generateUrl()

        mockView.expectHandleLoadingStart(1)
        mockView.expectReload(1)
        mockView.expectHandleLoadingStop(1)
        mockRepository.expectLoadItems(items: [], error: ParseError.parseIssue)
        
        serviceUnderTest.loadFile(url: url)
        
        XCTAssertTrue(serviceUnderTest.itemsCount() == 0)
        XCTAssertEqual(expected, mockView.handleError as? ParseError)
    }
    
    func testLoadItemsSuccess() {
        let expected = [generateItem(), generateItem()]
        let url = generateUrl()

        mockView.expectHandleLoadingStart(1)
        mockView.expectReload(2)
        mockView.expectHandleLoadingStop(1)
        mockRepository.expectLoadItems(items: expected, error: nil)
        
        serviceUnderTest.loadFile(url: url)
        
        for (index, expected) in expected.enumerated() {
            let actual = serviceUnderTest.item(at: index)
            XCTAssertEqual(expected, actual)
        }
        
        XCTAssertEqual(expected.count, serviceUnderTest.itemsCount())
    }
    
    private func generateItem() -> Item {
        let dictionary = [ItemKey.firstName.rawValue: "name",
                          ItemKey.surname.rawValue: "surname",
                          ItemKey.issueCount.rawValue: "0",
                          ItemKey.dateOfBirth.rawValue: "1978-01-02T00:00:00"]
        
        return Item(dictionary: dictionary)
    }
    
    private func generateUrl() -> URL {
        return URL(fileURLWithPath: "path")
    }

}
