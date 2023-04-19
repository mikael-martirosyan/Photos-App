//
//  AlertControllerCreator.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit

class AlertControllerCreator {
    
    func wrongLoginAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка авторизации", message: "Данного пользователя не существует. Попробуйте заново", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        return alert
    }
    
    func wrongPasswordAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка авторизации", message: "Неверно введен пароль. Попробуйте заново", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        return alert
    }
    
    func emptyTextFieldAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка", message: "Заполнены не все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        return alert
    }
    
    func successfulRegisterAlert(controller: UIViewController) -> UIAlertController {
        let alert = UIAlertController(title: "Поздравляем!", message: "Регистрация успешно завершена!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Продолжить", style: .cancel) { _ in
            controller.dismiss(animated: true)
        }
        alert.addAction(action)
        return alert
    }
}
