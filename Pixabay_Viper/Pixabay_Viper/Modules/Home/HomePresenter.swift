//
//  HomePresenter.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import Foundation

final class HomePresenter: ViewToPresenterHomeProtocol{
    
    // MARK: Properties
    weak var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?

    var imagesList: [Image] = []
    var selectedCategory: Category = .all
    var currentPage = 1
    var searchText: String = ""
    
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.fetchImages(category: selectedCategory, query: nil, currentPage: currentPage)
    }
    
    func removeLastResults() {
        currentPage = 1
        imagesList.removeAll()
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
        view?.indicatorView(animate: true)
        switch result {
        case .success(let images):
//            self.imagesList = images
            self.imagesList.append(contentsOf: images)
            view?.indicatorView(animate: false)
            view?.onDataFetchSuccess()
        case .failure(let error):
            view?.indicatorView(animate: false)
            view?.onDataFetchFailure(error)
        }
    }
}
