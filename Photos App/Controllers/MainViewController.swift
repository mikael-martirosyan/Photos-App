//
//  MainViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit
import CoreHaptics

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupConstraints()
    }
    
    @objc func signIn() {
        guard let loginText = mainView.login.text, let passwordText = mainView.password.text else { return }
        
        guard let user = checkUser(email: loginText) else {
            
            let _ = UIAlertController().customAlert(title: "Ошибка авторизации", message: "Такого пользователя не существует, либо неверно введен логин. Попробуйте заново", actionTitle: "OK") { alert in
                present(alert, animated: true)
            }
            errorFeedbackGenerator()
            return
        }
        
        if user.password == passwordText.lowercased() {
            UserModel.shared.saveCurrentUser(user: user)
            let containerVC = ContainerViewController()
            containerVC.modalPresentationStyle = .fullScreen
            present(containerVC, animated: true)
        } else {
            let _ = UIAlertController().customAlert(title: "Ошибка авторизации", message: "Неверно введен пароль. Попробуйте заново", actionTitle: "OK") { alert in
                present(alert, animated: true)
            }
            errorFeedbackGenerator()
        }
    }
    
    @objc func signUp() {
        let signUpVC = SignUpViewController()
        let navigationVC = UINavigationController(rootViewController: signUpVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
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

