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
        return ViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
