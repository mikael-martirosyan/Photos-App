//
//  PAPhotoImageView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 15.04.2023.
//

import UIKit

class PAPhotoImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
