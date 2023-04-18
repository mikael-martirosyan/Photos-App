//
//  LargeSizePhotoController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit
import Photos

class FullScreenPhotoViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Enum
    
    private enum StateEnum { case closed, opened }
    
    #warning("Порядок свойств")
    
    // MARK: - Internal properties

    let imageView = PAPhotoImageView(photoSize: .big, contentMode: .scaleAspectFit)
    
    // MARK: - Private properties
    
    private var state: StateEnum = .closed
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupUI()
        setupSubviews()
        setupContraints()
    }
    
    // MARK: - Objc functions
    
    @objc private func hideStatusBar() {
        switch state {
        case .closed:
            UIApplication.shared.isStatusBarHidden = true
            navigationController?.isNavigationBarHidden = true
            state = .opened
        case .opened:
            UIApplication.shared.isStatusBarHidden = false
            navigationController?.isNavigationBarHidden = false
            state = .closed
        }
    }
    
    @objc private func addAvatar() {
        guard let image = imageView.image else { return }
        guard let id = UserModel.shared.currentUser?.id else { return }
        SaveAndLoadImage.saveImage(image: image, id: id)
        
        NotificationCenter.default.post(name: .changeAvatar, object: nil)
    }
    
    // MARK: - Functions
    
    private func setupConfig() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сделать аватаркой", style: .plain, target: self, action: #selector(addAvatar))
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideStatusBar))
        tapGestureRecognizer.delegate = self
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupSubviews() {
        view.addSubview(imageView)
    }

    private func setupContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
