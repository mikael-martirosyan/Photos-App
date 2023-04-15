//
//  SignUpView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpView: UIView {
    
    let signUpStackView = SignUpStackView()
    
    let signUpTitle: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    let signUpButton = PAFilledButton(title: "Зарегистироваться")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConfig()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConfig() {
        signUpTitle.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.axis = .vertical
        signUpStackView.spacing = 5.0
        signUpStackView.distribution = .fillEqually
    }
    
    private func setupContraints() {
        addSubview(signUpTitle)
        addSubview(signUpButton)
        addSubview(signUpStackView)


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
