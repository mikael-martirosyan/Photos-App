//
//  SignUpStackView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpStackView: UIStackView {
    
    let name        = PASignUpTextField(placeholder: "Имя")
    let secondName  = PASignUpTextField(placeholder: "Фамилия")
    let id          = PASignUpTextField(placeholder: "Ник")
    let email       = PASignUpTextField(placeholder: "Email")
    let password    = PASignUpTextField(placeholder: "Пароль",
                                        isSecureTextEntry: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConfig()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        addArrangedSubview(name)
        addArrangedSubview(secondName)
        addArrangedSubview(id)
        addArrangedSubview(email)
        addArrangedSubview(password)
    }
    
    private func setupConfig() {
        axis = .vertical
        spacing = 5.0
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
}
