//
//  PAPhotoImageView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 15.04.2023.
//

import UIKit

class PAPhotoImageView: UIImageView {
    
    enum PhotoSize { case big, small }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(photoSize: PhotoSize, contentMode: UIView.ContentMode) {
        self.init(image: nil)
        
        if photoSize == .small {
            self.contentMode = contentMode
            clipsToBounds = true
            translatesAutoresizingMaskIntoConstraints = false
        } else if photoSize == .big {
            self.contentMode = contentMode
            translatesAutoresizingMaskIntoConstraints = false
        } else {
            fatalError("Choose size")
        }
    }
}
