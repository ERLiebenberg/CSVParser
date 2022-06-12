//
//  MockView.swift
//  CSVParserTests
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import XCTest

@testable import CSVParser

class MockView {
    
    private var reloadViewCount = 0
    private var handleLoadingStartCount = 0
    private var handleLoadingStopCount = 0
    private(set) var handleError: Error?
    
    func verify() {
        let verified = reloadViewCount == 0 &&
        handleLoadingStartCount == 0 &&
        handleLoadingStopCount == 0
        
        XCTAssertTrue(verified)
    }
    
    func expectReload(_ times: Int) {
        reloadViewCount = times
    }
    
    func expectHandleLoadingStart(_ times: Int) {
        handleLoadingStartCount = times
    }
    
    func expectHandleLoadingStop(_ times: Int) {
        handleLoadingStopCount = times
    }
    
    func expectHandleError(_ error: Error) {
        handleError = error
    }
    
}

extension MockView: View {
    
    func handleLoadingStart() {
        handleLoadingStartCount -= 1
    }
    
    func handleLoadingStop() {
        handleLoadingStopCount -= 1
    }

    func reloadView() {
        reloadViewCount -= 1
    }
     
    func handleError(_ error: Error) {
        handleError = error
    }
    
}
