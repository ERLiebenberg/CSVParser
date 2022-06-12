//
//  LoadingIndicatorViewController.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/12.
//

import UIKit

protocol LoadingIndicatorViewController: UIViewController {
    
    func showLoadingIndicator()
    
    func hideLoadingIndicator()
}

extension LoadingIndicatorViewController {
    
    func showLoadingIndicator() {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .primaryColor
        
        indicator.startAnimating()
        view.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoadingIndicator() {
        let indicator = view.subviews.first {
            $0 as? UIActivityIndicatorView != nil
        }
        
        indicator?.removeFromSuperview()
    }
    
}
