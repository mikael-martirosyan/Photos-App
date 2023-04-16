//
//  SignUpView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpView: UIView {
    
    let signUpStackView = SignUpStackView()
    let signUpTitle = PATitleLabel(text: "Регистрация")
    let signUpButton = PAFilledButton(title: "Зарегистироваться")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(signUpTitle)
        addSubview(signUpButton)
        addSubview(signUpStackView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            signUpTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            signUpTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            signUpTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
        
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signUpStackView.bottomAnchor, constant: 50),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: 200),
            
            signUpStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            signUpStackView.topAnchor.constraint(equalTo: signUpTitle.bottomAnchor, constant: 100),
            signUpStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            signUpStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
}
