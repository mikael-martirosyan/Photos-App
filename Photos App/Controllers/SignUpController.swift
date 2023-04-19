//
//  SignUpViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Internal properties
    
    let signUpView = SignUpView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfiguration()
        setupUI()
        setupSubview()
        setupContraints()
    }

    // MARK: - Objc functions
    
    @objc func signUp() {
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
            
            let alert = AlertControllerCreator()
            present(alert.successfulRegisterAlert(controller: self), animated: true)
            
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            
        } else {
            let alertVC = AlertControllerCreator()
            present(alertVC.emptyTextFieldAlert(), animated: true)
            
            UINotificationFeedbackGenerator().notificationOccurred(.error)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func closeController() {
        dismiss(animated: true)
    }
}
