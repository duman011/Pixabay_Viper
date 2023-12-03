//
//  ImageCollectionCell.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 4.12.2023.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    //MARK: - Cell's Identifier
    static let identifier = "ImageCollectionCell"
    
    //MARK: - UI Elements
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
           super.init(frame: frame)
           configureUI()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       // MARK: - UI Configuration
       private func configureUI() {
        
       }
}
