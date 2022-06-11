//
//  ViewController.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //TODO: get count from array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        
        //TODO: configure cell
        
        return cell
    }
}

class TableViewCell: UITableViewCell {
    
    static let identifier = "cellId"
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
            contentView.backgroundColor = .lightBackgroundColor
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .primaryColor
        }
    }
    
    @IBOutlet weak var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.textColor = .darkTextColor
        }
    }
    
    @IBOutlet weak var rightDetailLabel: UILabel! {
        didSet {
            rightDetailLabel.textColor = .secondaryColor
            
        }
    }
    
}

