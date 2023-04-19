//
//  MenuViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 07.04.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Internal properties
    
    weak var delegate: LoginControllerDelegate?
    
    // MARK: - Private properties
    
    private let menuView = MenuView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfiguration()
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Deinitializer
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .changeAvatar, object: nil)
        print("MenuViewController closed")
    }
    
    // MARK: - Objc functions
    
    @objc private func toListOfUsers() {
        let allUsersTVC = ListOfUsersController(title: "List of users")
        let navigationVC = UINavigationController(rootViewController: allUsersTVC)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
    
    @objc private func logOut() {
        guard let delegate = delegate else { return }
        delegate.logOut()
    }
    
    @objc private func changeAvatar(notification: Notification) {
        guard let user = UserModel.shared.currentUser else { return }
        let image = SaveAndLoadImage.loadImage(id: user.id)
        if image != nil {
            menuView.avatarImageView.image = image
            menuView.avatarImageView.layoutIfNeeded()
        } else {
            fatalError("Image not found")
        }
    }
    
    // MARK: - Functions
    
    private func setupConfiguration() {
        guard let user = UserModel.shared.currentUser else { return }
        
        menuView.nameLabel.text = "\(user.name)\n\(user.secondName)"
        menuView.idLabel.text = "@\(user.id)"
        
        if let image = SaveAndLoadImage.loadImage(id: user.id) {
            menuView.avatarImageView.image = image
        } else {
            menuView.avatarImageView.image = UIImage(named: "user")
        }
        
        menuView.listOfUsers.addTarget(self, action: #selector(toListOfUsers), for: .touchUpInside)
        menuView.logOut.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeAvatar), name: .changeAvatar, object: nil)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        view.addSubview(menuView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
