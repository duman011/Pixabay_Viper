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
    
    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        print("View receives the response from Presenter and updates itself.")
        imageLabel.text = image.tags
        imageView.downloadImage(fromURL: image.largeImageURL)
        self.navigationItem.title = "Image Detail"
    }
    
    func onGetDataFromURLFailure(_ image: Image) {
        print("View receives the response from Presenter and updates itself.")
        imageLabel.text = "Image Gelmedi Error !"
        self.navigationItem.title = "Image Gelmedi Error"
    }
}


// MARK: - UI Setup
extension ImageDetailView {
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubviewsExt(imageView, imageLabel)
        
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             leading: view.leadingAnchor,
                             trailing: view.trailingAnchor,
                             size: .init(heightSize: 150))
        
        imageLabel.anchor(top: imageView.bottomAnchor,
                         leading: view.leadingAnchor,
                         trailing: view.trailingAnchor)
    }
}
