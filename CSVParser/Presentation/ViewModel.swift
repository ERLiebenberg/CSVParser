//
//  ViewModel.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

class ViewModel {
    
    private let items = [Item(firstName: "name", surname: "surname", issueCount: "count", dateOfBirth: "date")]
    
    func itemsCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Item? {
        guard items.count > index else {
            return nil
        }
        
        return items[index]
    }
    
}
