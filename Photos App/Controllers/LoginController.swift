//
//  LoginViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Internal properties
    
    let loginView = LoginView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfiguration()
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Objc functions
    
    @objc func signIn() {
        // Развертывание опционалов
        guard let loginText = loginView.loginStackView.loginTextField.text,
              let passwordText = loginView.loginStackView.passwordTextField.text
        else { return }
        
        // Проверка на пустые строки
        guard (!loginText.isEmpty && !passwordText.isEmpty)
        else {
            let alertVC = AlertControllerCreator()
            present(alertVC.emptyTextFieldAlert(), animated: true)
            errorFeedbackGenerator()
            return
        }
        
        // Получение пользователя по логину
        guard let user = checkUser(email: loginText) else {
            let alertVC = AlertControllerCreator()
            present(alertVC.wrongLoginAlert(), animated: true)
            errorFeedbackGenerator()
            return
        }
        
        // Проверка пароля
        guard user.password == passwordText
        else {
            let alertVC = AlertControllerCreator()
            present(alertVC.wrongPasswordAlert(), animated: true)
            errorFeedbackGenerator()
            return
        }
        
        UserModel.shared.saveCurrentUser(user: user)
        let containerVC = ContainerController()
        containerVC.modalPresentationStyle = .fullScreen
        present(containerVC, animated: true)
    }
    
    @objc func signUp() {
        let signUpVC = SignUpController()
        let navigationVC = UINavigationController(rootViewController: signUpVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Functions
    
    private func checkUser(email: String) -> UserStruct? {
        let listOfUsers = UserModel.shared.listOfUsers
        
        for user in listOfUsers {
            let inputEmail = email.lowercased()
            let savedEmail = user.email.lowercased()
            
            if inputEmail == savedEmail {
                return user
            }
        }
        return nil
    }
    
    private func errorFeedbackGenerator() {
        let notificationFeedback = UINotificationFeedbackGenerator()
        notificationFeedback.notificationOccurred(.error)
        
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
    }
}
