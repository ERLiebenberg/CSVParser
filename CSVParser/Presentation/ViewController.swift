//
//  ViewController.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import UIKit

class ViewController: UIViewController, LoadingIndicatorViewController, AlertPresenterViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.backgroundColor = .lightBackgroundColor
        }
    }

    private lazy var viewModel: ViewModel = {
        return ViewModel(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem?.tintColor = .primaryColor
        
        if let url = Bundle.main.url(forResource: "issues", withExtension: "csv") {
            viewModel.loadFile(url: url)
        }
    }
    
    @IBAction func documentBrowserTapped(sender: Any) {
        presentSingleCSVDocumentPicker()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell,
                let item = viewModel.item(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(item)
        
        return cell
    }
}

extension ViewController: View {
    
    func reloadView() {
        tableView.reloadData()
    }
}

extension ViewController: LoadingHandler {
    
    func handleLoadingStart() {
        showLoadingIndicator()
    }
    
    func handleLoadingStop() {
        hideLoadingIndicator()
    }
}

extension ViewController: ErrorHandler {
    
    func handleError(_ error: Error) {
        presentAlert(error: error)
    }
}

extension ViewController: DocumentPresenterViewController {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        viewModel.loadFile(url: url)
    }
    
}
