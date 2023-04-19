//
//  PhotosCollectionViewController.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 04.04.2022.
//

import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: - Internal properties
    
    var assets = PHFetchResult<PHAsset>()
    
    let itemPerRow: CGFloat = 3.0
    let insets = UIEdgeInsets(top: 2.0, left: 2.0, bottom: 2.0, right: 2.0)
    
    weak var delegate: PhotosControllerDelegate?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfiguration()
    }
    
    // MARK: - Deinitializer
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
        print("PhotosCollectionViewController closed")
    }
    
    // MARK: - Objc functions
    
    @objc func didTapMenuButton() {
        guard let delegate = delegate else { return }
        delegate.didTapMenuButton()
    }
    
    // MARK: - Functions
    
    private func setupConfiguration() {
        guard let id = UserModel.shared.currentUser?.id else { return }
        title = "@\(id)"
        
        collectionView.contentSize = .zero
        collectionView.registerCell(PhotoCell.self)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .done, target: self, action: #selector(didTapMenuButton))
        
        checkStatus { status in
            guard status else { return }
            self.fetchAsset()
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        PHPhotoLibrary.shared().register(self)
    }
    
    // MARK: - CollectionView Data Source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as PhotoCell
    
        PHImageManager.default().requestImage(for: assets[indexPath.item], targetSize: cell.photoImageView.bounds.size, contentMode: .aspectFit, options: nil) { image, _ in
            guard let image = image else { return }
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }
        return cell
    }
    
    // MARK: - CollectionView Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fullScreenPhotoVC = FullScreenPhotoViewController()
        
        PHImageManager.default().requestImage(for: assets[indexPath.item], targetSize: fullScreenPhotoVC.imageView.frame.size, contentMode: .aspectFit, options: nil) { image, _ in
            print(Thread.current)
            guard let image = image else { return }
            DispatchQueue.main.async {
                fullScreenPhotoVC.imageView.image = image
            }
        }
        
        navigationController?.pushViewController(fullScreenPhotoVC, animated: true)
    }
}
