//
//  ContainerController + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 19.04.2023.
//

import UIKit

// MARK: - ContainerController + PhotosControllerDelegate

extension ContainerController: PhotosControllerDelegate {
    func didTapMenuButton() {
        switch menuState {
        case .isClosed:
            changeState(moveTo: .isOpened)
        case .isOpened:
            changeState(moveTo: .isClosed)
        }
    }
}

// MARK: - ContainerController + MenuViewControllerDelegate

extension ContainerController: LoginControllerDelegate {
    func logOut() {
        UserModel.shared.currentUser = nil
        
        menuVC.willMove(toParent: nil)
        menuVC.view.removeFromSuperview()
        menuVC.removeFromParent()
        
        photosCVC.willMove(toParent: nil)
        photosCVC.view.removeFromSuperview()
        photosCVC.removeFromParent()
        
        navigationVC?.willMove(toParent: nil)
        navigationVC?.view.removeFromSuperview()
        navigationVC?.removeFromParent()
        
        dismiss(animated: true)
        
        let vc = LoginController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
