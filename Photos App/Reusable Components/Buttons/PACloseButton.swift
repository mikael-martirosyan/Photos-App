//
//  PACloseButton.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 16.04.2023.
//

import UIKit

class PACloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setImage(UIImage(systemName: "multiply"), for: .normal)
        tintColor = .systemBlue
    }
}
