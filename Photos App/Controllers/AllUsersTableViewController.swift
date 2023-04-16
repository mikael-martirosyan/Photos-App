//
//  AllUsersTableViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit

class AllUsersTableViewController: UITableViewController {
    
    private var users = [UserStruct]()
    private let closeButton = PACloseButton()
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .systemBackground
        tableView.register(ListOfUsersCell.self, forCellReuseIdentifier: CellIdentifier.allUsersCell.rawValue)

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .done, target: self, action: #selector(closeController))
        
        users = UserModel.shared.listOfUsers
        
        closeButton.addTarget(self, action: #selector(closeController), for: .touchUpInside)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.allUsersCell.rawValue, for: indexPath) as? ListOfUsersCell else { fatalError() }

        let user = users[indexPath.row]
        
        if let image = SaveAndLoadImage.loadImage(id: user.id) {
            cell.avatarImageView.image = image
        }
        cell.nameLabel.text = user.name + " " + user.secondName
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc private func closeController() {
        dismiss(animated: true)
    }
}
