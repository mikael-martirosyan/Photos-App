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
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистироваться", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContraints() {
        addSubview(signUpTitle)
        signUpTitle.translatesAutoresizingMaskIntoConstraints = false
        signUpTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signUpTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        signUpTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        signUpTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        
        addSubview(signUpStackView)
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.axis = .vertical
        signUpStackView.spacing = 5.0
        signUpStackView.distribution = .fillEqually
        signUpStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signUpStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        signUpStackView.topAnchor.constraint(equalTo: signUpTitle.bottomAnchor, constant: 100).isActive = true
        signUpStackView.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -100).isActive = true
        signUpStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        signUpStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
    }
}
