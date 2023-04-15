//
//  PhotosCell.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit

class PhotosCell: UICollectionViewCell {
    
    let photoImageView = PAPhotoImageView(image: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupSubviews() {
        addSubview(photoImageView)
    }
}

