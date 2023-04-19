//
//  LoginStackView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 18.04.2023.
//

import UIKit

class LoginStackView: UIStackView {
    
    // MARK: - Internal properties
    
    let loginTextField      = PALoginTextField(placeholder: "Введите email")
    let passwordTextField   = PALoginTextField(placeholder: "Введите пароль", isSecureTextEntry: true)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConfiguration()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupConfiguration() {
        axis = .vertical
        spacing = 20
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupSubviews() {
        addArrangedSubview(loginTextField)
        addArrangedSubview(passwordTextField)
    }
}
