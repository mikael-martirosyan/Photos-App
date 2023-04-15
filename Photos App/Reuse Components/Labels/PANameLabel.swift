//
//  PANameLabel.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 15.04.2023.
//

import UIKit

class PANameLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        text = ""
        textColor = .black
        font = UIFont.systemFont(ofSize: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
