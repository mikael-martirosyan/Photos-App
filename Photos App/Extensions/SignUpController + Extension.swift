//
//  SignUpController + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 19.04.2023.
//

import UIKit

// MARK: - SignUpController + Setup

extension SignUpController {
    func setupConfiguration() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeController))
        
        signUpView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        for case let textField as UITextField in signUpView.signUpStackView.arrangedSubviews {
            textField.delegate = self
        }
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setupSubview() {
        view.addSubview(signUpView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpView.topAnchor.constraint(equalTo: view.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            signUpView.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
}

// MARK: - SignUpController + UITextFieldDelegate

extension SignUpController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let arrangedSubviews = signUpView.signUpStackView.arrangedSubviews
        
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
