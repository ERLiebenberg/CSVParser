//
//  ViewController.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private lazy var viewModel: ViewModel = {
        return ViewModel(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "issues", withExtension: "csv") else {
            return
        }
        
        viewModel.loadFile(url: url)
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
        //TODO: show loading indicator
    }
    
    func handleLoadingStop() {
        //TODO: hide loading indicator
    }
}

extension ViewController: ErrorHandler {
    
    func handleError(_ error: Error) {
        //TODO: display alert with message
        print("error: \(error.localizedDescription)")
    }
}
