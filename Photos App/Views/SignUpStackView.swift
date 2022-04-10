//
//  SignUpStackView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import UIKit

class SignUpStackView: UIStackView {
    
    let name: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        return textField
    }()
    
    let secondName: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Фамилия"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        return textField
    }()
    
    let id: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ник"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        return textField
    }()
    
    let email: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почта"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        return textField
    }()
    
    let password: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        addArrangedSubview(name)
        addArrangedSubview(secondName)
        addArrangedSubview(id)
        addArrangedSubview(email)
        addArrangedSubview(password)
    }
}
