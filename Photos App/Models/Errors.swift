//
//  Errors.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 18.04.2023.
//

import Foundation

enum PAError: Error {
    enum AuthError {
        case wrongLogin
        case wrongPassword
    }
    
    enum SignUpError {
        case shortLogin
        case shortPassword
        case emptyTextfield
    }
}
