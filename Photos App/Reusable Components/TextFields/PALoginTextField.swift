//
//  PALoginTextField.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 14.04.2023.
//

import UIKit

class PALoginTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String, isSecureTextEntry: Bool = false) {
        self.init(frame: .zero)
        
        self.isSecureTextEntry = isSecureTextEntry
        self.placeholder = placeholder
    }
    
    private func configure() {
        autocorrectionType = .no
        borderStyle = .roundedRect
        clearButtonMode = .whileEditing
        font = UIFont.systemFont(ofSize: 17)
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50),
            widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
