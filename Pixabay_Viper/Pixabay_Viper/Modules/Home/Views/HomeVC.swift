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
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.accessibilityIdentifier = "searchTextField"
        searchBar.placeholder = "Search an image"
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.showsBookmarkButton = true
        searchBar.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .bookmark, state: .normal)
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemGray.cgColor
        searchBar.layer.cornerRadius = 20
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        return searchBar
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
        configureNavTitle()
        view.backgroundColor = .systemBackground
        view.addSubviewsExt(searchBar, collectionView)
        searchBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, 
                         leading: view.safeAreaLayoutGuide.leadingAnchor,
                         trailing: view.safeAreaLayoutGuide.trailingAnchor,
                         padding: .init(leading: 10, trailing: 10))
        
        collectionView.anchor(top: searchBar.bottomAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: 10, leading: 10, trailing: 10))
    }
    
    private func configureNavTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Pixabay API"

        if let customFont = UIFont(name: "Agbalumo-Regular", size: 30) {
            titleLabel.font = customFont
       
            self.navigationItem.titleView = titleLabel
            
            let gradient = UIImage.gradientImage(bounds: view.bounds, colors: [.gradientBorder1, .gradientBorder2])
            let gradientColor = UIColor(patternImage: gradient)
            titleLabel.textColor = gradientColor
      
        }
       
    }
}

// MARK: - UITableView Delegate & Data Source
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let presenter {
            let lastCellIndex = presenter.imagesList.count - 1
            if indexPath.item == lastCellIndex {
                presenter.currentPage += 1
                presenter.searchImages()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.identifier, for: indexPath) as? ImageCollectionCell else {
            return UICollectionViewCell()
        }
        guard let image = presenter?.imagesList[indexPath.item] else {
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
        return CGSize(width: self.collectionView.frame.width / 2 - 10, height: self.collectionView.frame.width / 2 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 20
    }
}

extension HomeVC : PresenterToViewHomeProtocol {
    func onDataFetchSuccess() {
        Task {
            self.collectionView.reloadData()
        }
    }
    
    func onDataFetchFailure(_ error: Error?) {
        print("View receives the response from Presenter with error: \(String(describing: error))")
        Task {
            self.collectionView.reloadData()
        }
    }
    
    func indicatorView(_ show: Bool){
        Task{
            if show {
                view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
            } else {
                view.activityStopAnimating()
            }
        }
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            presenter?.removeLastResults()
            presenter?.searchText = searchText
           // presenter?.searchImages()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.removeLastResults()
        presenter?.searchImages()
        searchBar.text?.removeAll()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        let vc = CategorySelectionVC()
        vc.delegate = self
        if let sheet = vc.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium(), .large()]
        }
        present(vc, animated: true)
    }
}

extension HomeVC: CategorySelectionVCDelegate {
    func categorySelected(_ category: Category) {
        presenter?.selectedCategory = category
        presenter?.removeLastResults()
        presenter?.searchText.removeAll()
        searchBar.setImage(category.icon, for: .bookmark, state: .normal)
        presenter?.searchImages()
    }
}
