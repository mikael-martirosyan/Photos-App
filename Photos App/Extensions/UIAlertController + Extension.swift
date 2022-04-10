//
//  UIAlertController + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit

extension UIAlertController {
    open func customAlert(title: String, message: String, actionTitle: String, completion: (UIAlertController) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(action)
        completion(alert)
    }
}
