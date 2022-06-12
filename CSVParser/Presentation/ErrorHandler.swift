//
//  ErrorHandler.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

protocol ErrorHandler {
    
    func handleError(_ error: Error)
}
