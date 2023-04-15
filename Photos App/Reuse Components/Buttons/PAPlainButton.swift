//
//  PAPlainButton.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 14.04.2023.
//

import UIKit

class PAPlainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
    }
    
    private func configure() {
        setTitleColor(UIColor.systemBlue, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
