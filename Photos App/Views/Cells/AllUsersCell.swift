//
//  ListOfUsersCell.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit

class AllUsersCell: UITableViewCell {

    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CellIdentifier.allUsersCell.rawValue)
        
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }
    
    private func setupContraints() {
        addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        name.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
