//
//  MainView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit

class MainView: UIView {
    
    let signInTitle: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    let login: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите логин"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.black.cgColor
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .next
        return textField
    }()
    
    let password: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        signInButton.layer.cornerRadius = signInButton.frame.width / 8
    }
    
    private func setupConstraints() {
        addSubview(signInTitle)
        signInTitle.translatesAutoresizingMaskIntoConstraints = false
        signInTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        signInTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signInTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInTitle.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.topAnchor.constraint(equalTo: signInTitle.bottomAnchor, constant: 150).isActive = true
        login.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        login.heightAnchor.constraint(equalToConstant: 50).isActive = true
        login.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 20).isActive = true
        password.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
