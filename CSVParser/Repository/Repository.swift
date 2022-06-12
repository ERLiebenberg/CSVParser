//
//  Repository.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

protocol Repository {
    
    func loadItems(url: URL, result: @escaping ([Item], Error?) -> ())
}

class RepositoryImplementation {
    
    private let parser: CSVParser
    
    init(parser: CSVParser = CSVParserImplemtation()) {
        self.parser = parser
    }
    
    private func mapItems(from records: [[String]]) throws -> [Item] {
        guard let firstRecord = records.first,
              let keys = Validator.validateKeys(firstRecord, expectedKeys: ItemKey.allCasesAsStrings()) else {
                  throw ParseError.invalidKeys
              }
        
        var items = [Item]()
        
        for values in records {
            guard values != keys else { continue }
            
            if let dictionary = Validator.validateDictionary(keys: keys, values: values) {
                items.append(Item(dictionary: dictionary))
            }
        }
        
        return items
    }
}

extension RepositoryImplementation: Repository {
    
    func loadItems(url: URL, result: @escaping ([Item], Error?) -> ()) {
        parser.parse(path: url.path, result: { records, error in
            guard let records = records, error == nil else {
                result([], error)
                return
            }
        
            do {
                let items = try self.mapItems(from: records)
                result(items, nil)
            } catch {
                result([], error)
            }
        })
    }
    
}
