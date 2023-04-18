//
//  ReusableProtocol + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 17.04.2023.
//

import UIKit

extension Reusable where Self: UIView {
    static var reuseID: String {
        return String(describing: self)
    }
}
