//
//  ContainerViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 07.04.2022.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Private properties
    
    enum MenuState { case isOpened, isClosed }
    
    var menuState: MenuState = .isClosed
        
    let photosCVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    lazy var menuVC = MenuViewController()
    var navigationVC: UINavigationController?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuVC()
        setupPhotosVC()
        setupGestureRecognizer()
    }
    
    // MARK: - Objc functions
    
    @objc func swipeToOpenMenu() {
        switch menuState {
        case .isClosed:
            changeState(moveTo: .isOpened)
        default:
            break
        }
    }
    
    @objc func swipeToCloseMenu() {
        switch menuState {
        case .isOpened:
            changeState(moveTo: .isClosed)
        default:
            break
        }
    }
    
    // MARK: - Functions
    
    func setupPhotosVC() {
        photosCVC.delegate = self
        let navigationVC = UINavigationController(rootViewController: photosCVC)
        addChild(navigationVC)
        view.addSubview(navigationVC.view)
        navigationVC.didMove(toParent: self)
        self.navigationVC = navigationVC
    }
    
    func setupMenuVC() {
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
    }
    
    func setupGestureRecognizer() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToOpenMenu))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeToCloseMenu))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    func changeState(moveTo: MenuState) {
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
}
