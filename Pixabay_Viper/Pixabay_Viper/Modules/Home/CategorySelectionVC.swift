//
//  CategorySelectionVC.swift
//  Pixabay_Viper
//
//  Created by Erislam Nurluyol on 4.12.2023.
//

import UIKit

class CategorySelectionVC: UIViewController {
    
    //MARK: - UI Elements
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
        collectionView.fillSuperview(padding: .init(top: 20,
                                                   leading: 10,
                                                   trailing: 10))
    }

}

extension CategorySelectionVC: UICollectionViewDelegate {
    
}

extension CategorySelectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width / 2) - 5, height: 100)
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
