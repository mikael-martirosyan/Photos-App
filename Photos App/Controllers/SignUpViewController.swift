//
//  SignUpViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpViewController: UIViewController, UIScrollViewDelegate {
    
    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupContraints()
    }

    @objc private func signUp() {
        let stackViewItem = signUpView.signUpStackView
        
        if let name = stackViewItem.name.text, name.count > 0,
           let secondName = stackViewItem.secondName.text, secondName.count > 0,
           let nickName = stackViewItem.id.text, nickName.count > 0,
           let email = stackViewItem.email.text, email.count > 0,
           let password = stackViewItem.password.text, password.count > 0 {
            
            UserModel.shared.saveToUserList(name: name, secondName: secondName, nickName: nickName, email: email, password: password)
            
            print(UserModel.shared.listOfUsers)
            
            let alert = UIAlertController(title: "Поздравляем!", message: "Регистрация успешно завершена!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.dismiss(animated: true)
            }
            
            alert.addAction(action)
            present(alert, animated: true)
            
            let notificationFeedback = UINotificationFeedbackGenerator()
            notificationFeedback.notificationOccurred(.success)
            
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.impactOccurred()
            
        } else {
            let _ = UIAlertController().customAlert(title: "Ошибка", message: "Заполнены не все поля", actionTitle: "OK") { alert in
                present(alert, animated: true)
            }
            
            let notificationFeedback = UINotificationFeedbackGenerator()
            notificationFeedback.notificationOccurred(.error)
            
            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
            impactFeedback.impactOccurred()
        }
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func closeController() {
        dismiss(animated: true)
    }

    
    private func setupConfig() {
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeController))
        
        signUpView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGR)
    }
    
    private func setupContraints() {
        view.addSubview(signUpView)
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        signUpView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
}
