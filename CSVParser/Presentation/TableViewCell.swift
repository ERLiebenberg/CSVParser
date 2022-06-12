//
//  TableViewCell.swift
//  CSVParser
//
//  Created by Errol Liebenberg on 2022/06/11.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "cellId"
    
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 10
            contentView.backgroundColor = .lightBackgroundColor
        }
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .primaryColor
        }
    }
    
    @IBOutlet private weak var subTitleLabel: UILabel! {
        didSet {
            subTitleLabel.textColor = .darkTextColor
        }
    }
    
    @IBOutlet private weak var rightDetailLabel: UILabel! {
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
