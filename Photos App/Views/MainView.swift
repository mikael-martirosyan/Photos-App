//
//  MainView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit

class MainView: UIView {
    
    let loginTitle = PATitleLabel(text: "Вход")
    
    let loginTextField = PALoginTextField(placeholder: "Введите email")
    let passwordTextField = PALoginTextField(placeholder: "Введите пароль", isSecureTextEntry: true)
    
    let enterButton = PAFilledButton(title: "Войти")
    let signUpButton = PAPlainButton(title: "Регистрация")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(loginTitle)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            loginTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            loginTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTitle.heightAnchor.constraint(equalToConstant: 50),
            loginTitle.widthAnchor.constraint(equalToConstant: 150),
            
            loginTextField.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 150),
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
