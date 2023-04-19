//
//  LoginController + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

// MARK: - LoginController + Setup

extension LoginController {
    func setupConfiguration() {
        loginView.enterButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        for case let textField as UITextField in loginView.loginStackView.arrangedSubviews {
            textField.delegate = self
        }
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupSubviews() {
        view.addSubview(loginView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - LoginController + UITextFieldDelegate

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let arrangedSubviews = loginView.loginStackView.arrangedSubviews
        
        guard let index = arrangedSubviews.firstIndex(of: textField) else { return true }
        
        let nextIndex = index + 1
        
        if nextIndex < arrangedSubviews.count {
            arrangedSubviews[nextIndex].becomeFirstResponder()
        } else {
            textField.becomeFirstResponder()
            hideKeyboard()
        }
            
        return true
    }
}
