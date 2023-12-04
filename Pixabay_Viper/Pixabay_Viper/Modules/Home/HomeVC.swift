//
//  HomeView.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit


final class HomeVC: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    
    private lazy var collectionView: UICollectionView = {
     
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: ImageCollectionCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

// MARK: - UI Setup
extension HomeVC {
    private func setupUI() {
        navigationItem.title = "Pixabay API"
        view.backgroundColor = .purple
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
}

// MARK: - UITableView Delegate & Data Source
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.identifier, for: indexPath) as? ImageCollectionCell else {
            return UICollectionViewCell()
        }
        guard let image = presenter?.imagesList?[indexPath.item] else {
            return UICollectionViewCell()
        }
        cell.updateUI(image)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
    }
}

extension HomeVC : PresenterToViewHomeProtocol {
    func onDataFetchSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func onDataFetchFailure(_ error: Error?) {
        print("View receives the response from Presenter with error: \(String(describing: error))")
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func indicatorView(animate: Bool){
        DispatchQueue.main.async {
            self.indicatorViewExt(animate: animate)
        }
    }
}
