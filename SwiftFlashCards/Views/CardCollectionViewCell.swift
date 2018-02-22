//
//  CardCollectionViewCell.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/21/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var cardQuestion: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews() {
        setupCategoryLabel()
        setupCardQuestion()
    }
    
    private func setupCategoryLabel() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor ).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        categoryLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupCardQuestion() {
        
    }
}
