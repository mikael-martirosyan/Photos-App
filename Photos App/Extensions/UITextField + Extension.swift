//
//  UITextField + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 28.05.2022.
//

import Foundation
import UIKit

extension UITextField {
    func configCell(placeholder: String) {
        self.placeholder = placeholder
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 17)
        self.clearButtonMode = .whileEditing
        self.borderStyle = .roundedRect
        self.autocorrectionType = .no
    }
}
