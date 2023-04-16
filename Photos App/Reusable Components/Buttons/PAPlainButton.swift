//
//  PAPlainButton.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 14.04.2023.
//

import UIKit

class PAPlainButton: UIButton {
    
    enum PAButtonStyle {
        case `default`, link, cancel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, alignment: UIControl.ContentHorizontalAlignment = .center, style: PAButtonStyle) {
        self.init(frame: .zero)
        
        contentHorizontalAlignment = alignment
        setTitle(title, for: .normal)
        configure(style: style)
    }
    
    private func configure(style: PAButtonStyle) {
        switch style {
        case .default:
            setTitleColor(.systemBlue, for: .normal)
        case .link:
            setTitleColor(.black, for: .normal)
        case .cancel:
            setTitleColor(.red, for: .normal)
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
}
