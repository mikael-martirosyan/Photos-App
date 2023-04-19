//
//  SignUpStackView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpStackView: UIStackView {
    
    // MARK: - Internal properties
    
    let nameTextField        = PASignUpTextField(placeholder: "Имя")
    let secondNameTextField  = PASignUpTextField(placeholder: "Фамилия")
    let idTextField          = PASignUpTextField(placeholder: "Ник")
    let emailTextField       = PASignUpTextField(placeholder: "Email")
    let passwordTextField    = PASignUpTextField(placeholder: "Пароль",
                                                 isSecureTextEntry: true)
    
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
        spacing = 5.0
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        addArrangedSubview(nameTextField)
        addArrangedSubview(secondNameTextField)
        addArrangedSubview(idTextField)
        addArrangedSubview(emailTextField)
        addArrangedSubview(passwordTextField)
    }
}
