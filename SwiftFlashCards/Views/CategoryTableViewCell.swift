//
//  CategoryTableViewCell.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/20/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
        setupCategoryLabel()
        setupUsernameLabel()
    }
    
    private func setupCategoryLabel() {
        contentView.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupUsernameLabel() {
        contentView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        userNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        userNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
