//
//  TableViewCell.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import UIKit

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
    
    func configure(_ item: Item) {
        titleLabel.text = item.firstName + " " + item.surname
        subTitleLabel.text = item.dateOfBirth
        rightDetailLabel.text = item.issueCount
    }
    
}
