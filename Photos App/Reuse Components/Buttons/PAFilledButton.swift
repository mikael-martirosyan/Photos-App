//
//  PAFilledButton.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 13.04.2023.
//

import UIKit

class PAFilledButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 8
    }
    
    private func configure() {
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
}
