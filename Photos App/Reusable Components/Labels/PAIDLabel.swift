//
//  PAIDLabel.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 16.04.2023.
//

import UIKit

class PAIDLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .lightGray
        font = UIFont.systemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
