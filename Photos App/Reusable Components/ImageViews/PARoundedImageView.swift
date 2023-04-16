//
//  PARoundedImageView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 13.04.2023.
//

import UIKit

class PARoundedImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String = "person") {
        self.init(frame: .zero)
        
        image = UIImage(named: name)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    private func configure() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
//        image = UIImage(named: "user")
        translatesAutoresizingMaskIntoConstraints = false
    }
}
