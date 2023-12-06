//
//  HomePresenter.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


final class HomePresenter: ViewToPresenterHomeProtocol{
    
    // MARK: Properties
    weak var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    var imagesList: [Image] = []
    var selectedCategory: Category = .all
    var searchText: String = ""
    var currentPage = 1
    
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.fetchImages(category: selectedCategory, query: nil, currentPage: currentPage)
    }
    
    func removeLastResults() {
        imagesList.removeAll()
        currentPage = 1
        searchText.removeAll()
    }
    
    func searchImages() {
        interactor?.fetchImages(category: selectedCategory, query: searchText, currentPage: currentPage)
    }
    
    func numberOfRowsInSection() -> Int { return imagesList.count }
    
    func didSelectRow(at index: Int) { router?.pushToImageDetail(on: view!, with: imagesList[index]) }
}



// MARK: - Outputs to view
extension HomePresenter: InteractorToPresenterHomeProtocol {
    func didFetchImages(with result: Result<[Image], Error>) {
        view?.indicatorView(true)
        
        switch result {
        case .success(let images):
            self.imagesList.append(contentsOf: images)
            self.view?.onDataFetchSuccess()
            self.view?.indicatorView(false)
        case .failure(let error):
            self.view?.onDataFetchFailure(error)
            self.view?.indicatorView(false)
        }
        
    }
}

