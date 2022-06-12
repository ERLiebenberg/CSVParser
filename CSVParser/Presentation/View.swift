//
//  View.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

protocol View: LoadingHandler, ErrorHandler, AnyObject {
    
    func reloadView()
}
