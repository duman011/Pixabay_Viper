//
//  CategorySelectionVC.swift
//  Pixabay_Viper
//
//  Created by Erislam Nurluyol on 4.12.2023.
//

import UIKit

protocol CategorySelectionVCDelegate: AnyObject {
    func categorySelected(_ category: Category)
}

class CategorySelectionVC: UIViewController {
    
    weak var delegate: CategorySelectionVCDelegate?
    
    //MARK: - UI Elements
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
        return collectionView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.9)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.fillSuperview(padding: .init(top: 20))
    }

}

extension CategorySelectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.categorySelected(Category.allCases[indexPath.item])
        dismiss(animated: true)
    }
}

extension CategorySelectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width / 3) - 5, height: 100)
    }
}

extension CategorySelectionVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as? CategoryCollectionCell else { return .init() }
        cell.updateUI(Category.allCases[indexPath.item])
        return cell
    }
}
