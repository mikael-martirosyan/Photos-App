//
//  MenuView.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 07.04.2022.
//

import UIKit

class MenuView: UIView {
    
    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "person") // Default value
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "" // Default value
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    let secondName: UILabel = {
        let label = UILabel()
        label.text = "" // Default value
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    let id: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let listOfUsers: UIButton = {
        let button = UIButton()
        button.setTitle("List of users", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let logOut: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        button.tintColor = .red
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatar.layer.cornerRadius = avatar.frame.width / 2
    }
    
    private func setupConstraints() {
        addSubview(avatar)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 70).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(id)
        id.translatesAutoresizingMaskIntoConstraints = false
        id.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10).isActive = true
        id.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        id.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(secondName)
        secondName.translatesAutoresizingMaskIntoConstraints = false
        secondName.topAnchor.constraint(equalTo: id.bottomAnchor, constant: 15).isActive = true
        secondName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        secondName.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: secondName.bottomAnchor, constant: 5).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        name.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(listOfUsers)
        listOfUsers.translatesAutoresizingMaskIntoConstraints = false
        listOfUsers.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30).isActive = true
        listOfUsers.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        listOfUsers.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addSubview(logOut)
        logOut.translatesAutoresizingMaskIntoConstraints = false
        logOut.topAnchor.constraint(equalTo: listOfUsers.bottomAnchor, constant: 50).isActive = true
        logOut.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        logOut.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
