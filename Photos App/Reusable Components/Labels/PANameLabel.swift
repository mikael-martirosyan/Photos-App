//
//  PANameLabel.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 15.04.2023.
//

import UIKit

class PANameLabel: UILabel {
    
    enum LabelHeading {
        case big, small
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(heading: LabelHeading) {
        self.init(frame: .zero)
        
        configure(heading: heading)
    }
    
    private func configure(heading: LabelHeading) {
        switch heading {
        case .big:
            font = UIFont.boldSystemFont(ofSize: 23)
            numberOfLines = 0
        case .small:
            font = UIFont.systemFont(ofSize: 20)
            numberOfLines = 1
        }
        text = ""
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
}
