//
//  ContainerViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 07.04.2022.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private enum MenuState { case isOpened, isClosed }
    
    private var menuState: MenuState = .isClosed
        
    private let photosCVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var menuVC = MenuViewController()
    private var navigationVC: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()
        setupGestureRecognizer()
    }
    
    deinit {
//        let mainVC = LoginViewController()
//        mainVC.modalPresentationStyle = .fullScreen
//        present(mainVC, animated: true)
        
        print("ContainerViewController closed")
    }
    
    private func addSubView() {
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
    
        photosCVC.delegate = self
        let navigationVC = UINavigationController(rootViewController: photosCVC)
        addChild(navigationVC)
        view.addSubview(navigationVC.view)
        navigationVC.didMove(toParent: self)
        self.navigationVC = navigationVC
    }
    
    private func setupGestureRecognizer() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToOpenMenu))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToCloseMenu))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc private func swipeToOpenMenu() {
        switch menuState {
        case .isClosed:
            changeState(moveTo: .isOpened)
        default:
            break
        }
    }
    
    @objc private func swipeToCloseMenu() {
        switch menuState {
        case .isOpened:
            changeState(moveTo: .isClosed)
        default:
            break
        }
    }
}

extension ContainerViewController: PhotosControllerDelegate {
    func didTapMenuButton() {
        switch menuState {
        case .isClosed:
            changeState(moveTo: .isOpened)
        case .isOpened:
            changeState(moveTo: .isClosed)
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate {
    
    private func changeState(moveTo: MenuState) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
            guard let navVC = self.navigationVC else { return }

            if moveTo != .isClosed {
                let point = self.photosCVC.view.frame.size.width * (1.0/3.0)
                navVC.view.frame.origin.x = self.photosCVC.view.frame.size.width - point
                self.photosCVC.view.layer.opacity = 0.3
                self.photosCVC.navigationController?.view.layer.opacity = 0.3
            } else if moveTo != .isOpened {
                navVC.view.frame.origin.x = 0
                self.photosCVC.view.layer.opacity = 1
                self.photosCVC.navigationController?.view.layer.opacity = 1
            }
        } completion: { [weak self] done in
            if let self = self,
               done {
                self.menuState = moveTo
            }
        }
    }
    
    func logOut() {
        UserModel.shared.currentUser = nil
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        dismiss(animated: true)
    }
}
