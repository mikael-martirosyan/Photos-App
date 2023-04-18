//
//  SignUpViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

#warning("Добавить появление клавиатуры")

class SignUpController: UIViewController, UIScrollViewDelegate {
    
    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupUI()
        setupSubview()
        setupContraints()
    }

    #warning("alert 42-49")
    
    @objc private func signUp() {
        let stackViewItem = signUpView.signUpStackView
        
        if let name         = stackViewItem.nameTextField.text, name.count > 0,
           let secondName   = stackViewItem.secondNameTextField.text, secondName.count > 0,
           let nickName     = stackViewItem.idTextField.text, nickName.count > 0,
           let email        = stackViewItem.emailTextField.text, email.count > 0,
           let password     = stackViewItem.passwordTextField.text, password.count > 0 {
            
            UserModel.shared.saveToUserList(name: name,
                                            secondName: secondName,
                                            nickName: nickName,
                                            email: email,
                                            password: password)
            
            print(UserModel.shared.listOfUsers)
            
            let alert = UIAlertController(title: "Поздравляем!", message: "Регистрация успешно завершена!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.dismiss(animated: true)
            }
            
            alert.addAction(action)
            present(alert, animated: true)
            
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
        } else {
            let alertVC = AlertControllerCreator()
            present(alertVC.emptyTextFieldAlert(), animated: true)
            
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func closeController() {
        dismiss(animated: true)
    }

    private func setupConfig() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeController))
        
        signUpView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        for case let textField as UITextField in signUpView.signUpStackView.arrangedSubviews {
            textField.delegate = self
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupSubview() {
        view.addSubview(signUpView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpView.topAnchor.constraint(equalTo: view.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            signUpView.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
}

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
