//
//  PATitleLabel.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 14.04.2023.
//

import UIKit

class PATitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        
        self.text = text
    }
    
    private func configure() {
        font = UIFont.systemFont(ofSize: 25)
        textAlignment = .center
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50),
//            widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
