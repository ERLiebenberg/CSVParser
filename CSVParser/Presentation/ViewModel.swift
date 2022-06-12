//
//  ViewModel.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import Foundation

class ViewModel {
    
    private var items = [Item]()
    private let repository: Repository
    
    private weak var view: View?
    
    init(view: View, repository: Repository = RepositoryImplementation()) {
        self.view = view
        self.repository = repository
    }
    
    func loadFile(url: URL) {
        view?.handleLoadingStart()
        resetViewData()
    
        repository.loadItems(url: url) { [weak self] items, error in
            guard let error = error else {
                self?.items = items
                self?.view?.reloadView()
                self?.view?.handleLoadingStop()
                return
            }
            
            self?.view?.handleError(error)
            self?.view?.handleLoadingStop()
        }
    }
    
    func itemsCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Item? {
        guard items.count > index else {
            return nil
        }
        
        return items[index]
    }
    
    private func resetViewData() {
        items.removeAll()
        view?.reloadView()
    }
    
}
