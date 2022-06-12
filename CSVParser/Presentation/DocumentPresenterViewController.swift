//
//  DocumentPresenterViewController.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/12.
//

import UIKit
import UniformTypeIdentifiers

protocol DocumentPresenterViewController: UIViewController, UIDocumentPickerDelegate {
    
    func presentSingleCSVDocumentPicker()
}

extension DocumentPresenterViewController {
    
    func presentSingleCSVDocumentPicker() {
        guard let supportType = UTType(filenameExtension: "csv") else { return }
        
        present(supportedTypes: [supportType])
    }
    
    private func present(supportedTypes: [UTType], allowsMultipleSelection allow: Bool = false) {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: false)
        documentPicker.allowsMultipleSelection = allow
        documentPicker.delegate = self
        
        present(documentPicker, animated: true, completion: nil)
    }
}
