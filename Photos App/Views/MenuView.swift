//
//  MenuView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 07.04.2022.
//

import UIKit

class MenuView: UIView {
    
    // MARK: - Internal properties
    
    let avatarImageView = PARoundedImageView()
    
    let nameLabel = PANameLabel(heading: .big)
    let idLabel = PAIDLabel()
    
    let listOfUsers = PAPlainButton(title: "List of users", alignment: .left, style: .link)
    let logOut = PAPlainButton(title: "Exit", alignment: .left, style: .cancel)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConfiguration()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupConfiguration() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        addSubview(avatarImageView)
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(listOfUsers)
        addSubview(logOut)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            
            idLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            idLabel.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            listOfUsers.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            listOfUsers.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            listOfUsers.widthAnchor.constraint(equalToConstant: 150),
            
            logOut.topAnchor.constraint(equalTo: listOfUsers.bottomAnchor, constant: 50),
            logOut.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logOut.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
