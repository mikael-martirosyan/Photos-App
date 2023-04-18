//
//  MainView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Properties
    
    let title = PATitleLabel(text: "Вход")
    
    let loginStackView = LoginStackView()
    
    let enterButton = PAFilledButton(title: "Войти")
    let signUpButton = PAPlainButton(title: "Регистрация", style: .link)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConfiguration()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        addSubview(title)
        addSubview(loginStackView)
        addSubview(enterButton)
        addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.widthAnchor.constraint(equalToConstant: 150),
            
            loginStackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 150),
            loginStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            enterButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 50),
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
