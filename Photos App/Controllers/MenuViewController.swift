//
//  MenuViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 07.04.2022.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func logOut()
}

class MenuViewController: UIViewController {
    
    weak var delegate: MenuViewControllerDelegate?
    
    private let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupConfig()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .changeAvatar, object: nil)
        print("MenuViewController closed")
    }
    
    @objc private func toListOfUsers() {
        let allUsersTVC = AllUsersTableViewController(title: "List of users")
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
            menuView.avatarImageView.image = UIImage(systemName: "person")
        }
    }
    
    private func setupConfig() {
        view.backgroundColor = .systemBackground
        
        guard let user = UserModel.shared.currentUser else { return }
        
        menuView.nameLabel.text = "\(user.name)\n\(user.secondName)"
        menuView.idLabel.text = "@\(user.id)"
        
        let image = SaveAndLoadImage.loadImage(id: user.id)
        menuView.avatarImageView.image = image
        
        menuView.listOfUsers.addTarget(self, action: #selector(toListOfUsers), for: .touchUpInside)
        menuView.logOut.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeAvatar), name: .changeAvatar, object: nil)
    }
    
    private func setupConstraints() {
        view.addSubview(menuView)
        menuView.translatesAutoresizingMaskIntoConstraints = false
        menuView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
