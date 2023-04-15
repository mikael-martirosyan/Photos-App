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
        font = UIFont.systemFont(ofSize: 15)
        returnKeyType = .next
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
}
