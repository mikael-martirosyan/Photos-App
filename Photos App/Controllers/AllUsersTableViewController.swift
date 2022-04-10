//
//  AllUsersTableViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit

class AllUsersTableViewController: UITableViewController {
    
    private var users = [UserStruct]()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .systemBackground
        title = "List of users"
        
        tableView.register(AllUsersCell.self, forCellReuseIdentifier: CellIdentifier.allUsersCell.rawValue)

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .done, target: self, action: #selector(cancel))
        
        users = UserModel.shared.listOfUsers
        
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc private func cancel() {
        dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.allUsersCell.rawValue, for: indexPath) as? AllUsersCell else { fatalError() }

        let user = users[indexPath.row]
        
        if let image = SaveAndLoadImage.loadImage(id: user.id) {
            cell.avatar.image = image
        }
        cell.name.text = user.name + " " + user.secondName
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
