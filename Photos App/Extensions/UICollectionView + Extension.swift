//
//  UICollectionView + Extension.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 17.04.2023.
//

import UIKit

extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell> (_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseID)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)")}
        return cell
    }
}
