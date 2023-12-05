//
//  CategoryCollectionCell.swift
//  Pixabay_Viper
//
//  Created by Erislam Nurluyol on 4.12.2023.
//

import UIKit

final class CategoryCollectionCell: UICollectionViewCell {
    //MARK: - Cell's Identifier
    static let identifier = "CategoryCollectionCell"
    
    
    //MARK: - UI Elements
    private lazy var categoryIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
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
        backgroundColor = UIColor(red: 0.152, green: 0.192, blue: 0.356, alpha: 0.5)
        layer.cornerRadius = 15
        configureCategoryIcon()
        configureCategoryTitle()
    }
    
    private func configureCategoryIcon() {
        addSubview(categoryIcon)
        categoryIcon.centerXInSuperview()
        categoryIcon.anchor(bottom: safeAreaLayoutGuide.centerYAnchor)
    }
    
    private func configureCategoryTitle() {
        addSubview(categoryTitle)
        categoryTitle.anchor(top: safeAreaLayoutGuide.centerYAnchor,
                             leading: safeAreaLayoutGuide.leadingAnchor,
                             trailing: safeAreaLayoutGuide.trailingAnchor)
    }
    
    func updateUI(_ category: Category){
        categoryTitle.text = category.title
        let configuration = UIImage.SymbolConfiguration(pointSize: 30)

        categoryIcon.image = category.icon?.withTintColor(.gradientBorder1, renderingMode: .alwaysOriginal).withConfiguration(configuration)
    
    }
    
}
