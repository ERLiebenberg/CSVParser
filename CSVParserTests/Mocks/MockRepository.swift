//
//  MockRepository.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import XCTest

@testable import CSVParser

class MockRepository: Repository {
    
    private(set) var actualUrl: URL?
    
    private var expectedItems = [Item]()
    private var expectedError: Error?
    
    func expectLoadItems(items: [Item], error: Error?) {
        expectedItems = items
        expectedError = error
    }
    
    func loadItems(url: URL, result: @escaping ([Item], Error?) -> ()) {
        actualUrl = url
        result(expectedItems, expectedError)
    }
    
}
