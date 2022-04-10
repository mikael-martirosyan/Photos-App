//
//  LargeSizePhotoController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 09.04.2022.
//

import UIKit
import Photos

class FullScreenPhotoViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var state = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupContraints()
    }
    
    @objc private func hideStatusBar() {
        if state == 0 {
            UIApplication.shared.isStatusBarHidden = true
            navigationController?.isNavigationBarHidden = true
            state = 1
        } else {
            UIApplication.shared.isStatusBarHidden = false
            navigationController?.isNavigationBarHidden = false
            state = 0
        }
    }
    
    @objc private func addAvatar() {
        guard let image = imageView.image else { return }
        guard let id = UserModel.shared.currentUser?.id else { return }
        SaveAndLoadImage.saveImage(image: image, id: id)
        
        NotificationCenter.default.post(name: .changeAvatar, object: nil)
    }
    
    private func setupConfig() {
        view.backgroundColor = .systemBackground
                    
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сделать аватаркой", style: .plain, target: self, action: #selector(addAvatar))
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideStatusBar))
        tapGR.delegate = self
        view.addGestureRecognizer(tapGR)
    }

    private func setupContraints() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
