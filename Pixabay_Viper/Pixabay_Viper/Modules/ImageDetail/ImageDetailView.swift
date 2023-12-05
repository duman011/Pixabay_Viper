//
//  ImageDetailView.swift
//  ViperPattern
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit

final class ImageDetailView: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterImageDetailProtocol?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var imageTags: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var viewsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "eye.circle")
        imageView.anchor(size: .init(width: 35, height: 35))
        return imageView
    }()
    
    private lazy var viewsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var downloadsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.down.circle")
        imageView.anchor(size: .init(width: 35, height: 35))
        return imageView
    }()
    
    private lazy var downloadsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var collectionsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark.circle")
        imageView.anchor(size: .init(width: 35, height: 35))
        return imageView
    }()
    
    private lazy var collectionsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var likesImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.circle")
        imageView.anchor(size: .init(width: 35, height: 35))
        return imageView
    }()
    
    private lazy var likesCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var commentsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bubble.circle")
        imageView.anchor(size: .init(width: 35, height: 35))
        return imageView
    }()
    
    private lazy var commentsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}


extension ImageDetailView: PresenterToViewImageDetailProtocol {
    func onGetDataFromURLSuccess(_ image: Image) {
        imageView.downloadImage(fromURL: image.largeImageURL)
        
        viewsCount.text = image.views.description
        downloadsCount.text = image.downloads.description
        collectionsCount.text = image.collections.description
        likesCount.text = image.likes.description
        commentsCount.text = image.comments.description
        
        userImage.downloadImage(fromURL: image.userImageURL)
        userName.text = image.user
        imageTags.text = "Tags: " + image.tags
        self.navigationItem.title = "Image Detail"
    }
    
    func onGetDataFromURLFailure(_ image: Image) {
        print("View receives the response from Presenter and updates itself.")
        imageTags.text = "Image Gelmedi Error !"
        self.navigationItem.title = "Image Gelmedi Error"
    }
}


// MARK: - UI Setup
extension ImageDetailView {
    private func setupUI() {
        view.accessibilityIdentifier = "ImageDetailView"
        view.backgroundColor = .secondarySystemBackground
        view.addSubviewsExt(imageView,
                            imageTags,
                            userImage,
                            userName,
                            viewsImage,
                            viewsCount,
                            downloadsImage,
                            downloadsCount,
                            collectionsImage,
                            collectionsCount,
                            likesImage,
                            likesCount,
                            commentsImage,
                            commentsCount)
        
        userImage.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         leading: view.safeAreaLayoutGuide.leadingAnchor,
                         padding: .init(top: 10, leading: 10),
                         size: .init(width: 50, height: 50))
        userName.anchor(leading: userImage.trailingAnchor,
                        padding: .init(leading: 10))
        userName.centerYAnchor.constraint(equalTo:userImage.centerYAnchor).isActive = true
        
        imageView.anchor(top: userImage.bottomAnchor,
                         leading: view.safeAreaLayoutGuide.leadingAnchor,
                         trailing: view.safeAreaLayoutGuide.trailingAnchor,
                         size: .init(heightSize: view.frame.height / 2.5))
        
        viewsImage.anchor(top: imageView.bottomAnchor,
                          leading: view.safeAreaLayoutGuide.leadingAnchor,
                          padding: .init(leading: 10))
        
        viewsCount.anchor(top: imageView.bottomAnchor,
                          leading: viewsImage.trailingAnchor,
                          bottom: viewsImage.bottomAnchor)
        
        downloadsImage.anchor(top: imageView.bottomAnchor,
                              leading: viewsCount.trailingAnchor,
                              padding: .init(leading: 12))
        
        downloadsCount.anchor(top: imageView.bottomAnchor,
                              leading: downloadsImage.trailingAnchor,
                              bottom: downloadsImage.bottomAnchor)
        
        collectionsImage.anchor(top: imageView.bottomAnchor,
                                leading: downloadsCount.trailingAnchor,
                                padding: .init(leading: 12))
        
        collectionsCount.anchor(top: imageView.bottomAnchor,
                                leading: collectionsImage.trailingAnchor,
                                bottom: collectionsImage.bottomAnchor)
        
        likesImage.anchor(top: imageView.bottomAnchor,
                          leading: collectionsCount.trailingAnchor,
                          padding: .init(leading: 12))
        
        likesCount.anchor(top: imageView.bottomAnchor,
                          leading: likesImage.trailingAnchor,
                          bottom: likesImage.bottomAnchor)
        
        commentsImage.anchor(top: imageView.bottomAnchor,
                             leading: likesCount.trailingAnchor,
                             padding: .init(leading: 12))
        
        commentsCount.anchor(top: imageView.bottomAnchor,
                             leading: commentsImage.trailingAnchor,
                             bottom: commentsImage.bottomAnchor)
        
        imageTags.anchor(top: viewsImage.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor,
                         padding: .init(top: 10,
                                        leading: 10,
                                        trailing: 20))
    }
}
