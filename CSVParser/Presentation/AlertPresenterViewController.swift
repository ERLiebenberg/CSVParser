//
//  AlertPresenterViewController.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/12.
//

import UIKit

protocol AlertPresenterViewController: UIViewController {
    
    func presentAlert(error: Error)
}

extension AlertPresenterViewController {
    
    func presentAlert(error: Error) {
        let vc = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        vc.addAction(action)
        
        present(vc, animated: true, completion: nil)
    }
}
