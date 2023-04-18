//
//  ListOfUsersController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit

class ListOfUsersController: UITableViewController {
    
    // MARK: - Private properties
    
    private var users = [UserStruct]()
    private let closeButton = PACloseButton()
    
    // MARK: - Initializers
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConfigurations()
        setupUI()
    }
    
    // MARK: - Functions
    
    private func setupConfigurations() {
        tableView.registerCell(ListOfUsersCell.self)

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .done, target: self, action: #selector(closeController))
        
        users = UserModel.shared.listOfUsers
        
        closeButton.addTarget(self, action: #selector(closeController), for: .touchUpInside)
    }
    
    private func setupUI() {
        tableView.backgroundColor = .systemBackground
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListOfUsersCell

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
