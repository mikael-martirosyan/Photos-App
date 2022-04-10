//
//  SaveAndLoadImage.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 10.04.2022.
//

import UIKit

class SaveAndLoadImage {

    static func saveImage(image: UIImage, id: String) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileURL = documentsDirectory.appendingPathComponent(id)
        let path = fileURL.path
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
                
        if FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.removeItem(atPath: path)
            } catch {
                print(error)
            }
        }
        
        do {
            try data.write(to: fileURL)
            print(fileURL)
        } catch {
            print(error)
        }
    }
    
    static func loadImage(id: String) -> UIImage? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if let directionPath = paths.first {
            let imageURL = URL(fileURLWithPath: directionPath).appendingPathComponent(id)
            let image = UIImage(contentsOfFile: imageURL.path)
            return image
        } else {
            return nil
        }
    }
}
