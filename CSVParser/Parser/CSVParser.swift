//
//  CSVParser.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

protocol CSVParser {
    
    func parse(path: String, result: @escaping ([[String]]?, Error?) -> ())
    
}
