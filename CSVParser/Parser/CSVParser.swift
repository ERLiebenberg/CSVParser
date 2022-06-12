//
//  CSVParser.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation
import CSVImporter

protocol CSVParser {
    
    func parse(path: String, result: @escaping ([[String]]?, Error?) -> ())
    
}

struct CSVParserImplemtation: CSVParser {
    
    func parse(path: String, result: @escaping ([[String]]?, Error?) -> ()) {
        let importer = CSVImporter<[String]>(path: path)
        importer.startImportingRecords { $0 }.onFail {
            result(nil, ParseError.parseIssue)
        }.onFinish {
            result($0, nil)
        }
    }
    
}
