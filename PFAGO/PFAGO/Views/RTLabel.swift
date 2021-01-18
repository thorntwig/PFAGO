//
//  RTLabel.swift
//  PFAGO
//
//  Created by Robin Törnqvist on 2020-04-14.
//  Copyright © 2020 Robin Törnqvist. All rights reserved.
//

import UIKit

class RTLabel: UIView{
    
    var secondaryText: String? {
        didSet {
            secondaryLabel.text = secondaryText
        }
    }
    
    var text: String? {
        didSet {
            primaryLabel.text = text
        }
    }
    
    let secondaryLabel = UILabel()
    let primaryLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("janne")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        secondaryLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
    }
    
    func setup() {
        addSubview(secondaryLabel)
        addSubview(primaryLabel)
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondaryLabel.topAnchor.constraint(equalTo: topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            primaryLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            primaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            primaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
    }
}
