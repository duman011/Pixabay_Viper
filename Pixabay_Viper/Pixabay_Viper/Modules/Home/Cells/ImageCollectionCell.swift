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
    lazy var userContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        container.layer.cornerRadius = 30
        return container
    }()
    
    lazy var userName: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.numberOfLines = 1
        name.lineBreakMode = .byTruncatingTail
        name.font = UIFont.systemFont(ofSize: 19)
        return name
    }()
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var userImagePost: UIImageView = {
        let post = UIImageView()
        post.layer.cornerRadius = 30
        post.contentMode = .scaleAspectFill
        post.clipsToBounds = true
        
       
 

        return post
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
        layer.cornerRadius = 30
        addSubviewsExt(userImagePost)
        userImagePost.addSubview(userContainerView)
        userContainerView.addSubviewsExt(userImage, userName)
        
        configureUserImagePost()
        configureUserContainerView()
        configureUserImage()
        configureUserName()
    }
    
    private func configureUserImagePost() {
        userImagePost.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    private func configureUserContainerView() {
        userContainerView.anchor(leading: userImagePost.leadingAnchor,
                                 bottom: userImagePost.bottomAnchor,
                                 padding: .init(leading: 15,
                                                bottom: 15),
                                 size: .init(width: 210, height: 60))
        
        
    }
    
    private func configureUserImage() {
        userImage.anchor(leading: userContainerView.leadingAnchor,
                         padding: .init(leading:15),
                         size: .init(width: 50, height: 50))
        userImage.centerYInSuperview()
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPointZero, size: self.userImage.frame.size)
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]

        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: self.userImage.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.userImage.layer.addSublayer(gradient)
    }
    
    private func configureUserName() {
        userName.anchor(leading: userImage.trailingAnchor,
                        trailing: userContainerView.trailingAnchor,
                        padding: .init(leading:10, trailing: 10))
        userName.centerYInSuperview()
    }
    
    func updateUI(_ image: Image){
        userImagePost.downloadImage(fromURL: image.largeImageURL)
        userImage.downloadImage(fromURL: image.userImageURL)
        userName.text = image.user
    }
}
