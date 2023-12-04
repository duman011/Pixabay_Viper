//
//  UIImageView.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//

import UIKit

extension UIImageView {
    
    // MARK: - Image Download
    func downloadImage(fromURL url: String) {
        Task {
            image = await NetworkManager.shared.downloadImage(from: url) ?? UIImage(systemName: "xmark.circle.fill")
        }
    }  
}
