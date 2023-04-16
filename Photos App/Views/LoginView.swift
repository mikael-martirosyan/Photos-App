//
//  MainView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit

class LoginView: UIView {
    
    let title = PATitleLabel(text: "Вход")
    
    let loginTextField = PALoginTextField(placeholder: "Введите email")
    let passwordTextField = PALoginTextField(placeholder: "Введите пароль", isSecureTextEntry: true)
    
    let enterButton = PAFilledButton(title: "Войти")
    let signUpButton = PAPlainButton(title: "Регистрация", style: .default)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(title)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.widthAnchor.constraint(equalToConstant: 150),
            
            loginTextField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 150),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.widthAnchor.constraint(equalToConstant: 200),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            enterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterButton.heightAnchor.constraint(equalToConstant: 50),
            enterButton.widthAnchor.constraint(equalToConstant: 150),
            
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
