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

    var imagesList: [Image]?
    var selectedCategory: Category = .all
    
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.fetchImages(category: selectedCategory, query: nil)
    }
    
    func searchImages(query: String?) {
        interactor?.fetchImages(category: selectedCategory, query: query)
    }
    
    func numberOfRowsInSection() -> Int {
        guard let images = self.imagesList else {
            return 0
        }
        
        return images.count
    }
    
    func didSelectRow(at index: Int) {
        interactor?.retrieveImage(at: index)
    }
}



// MARK: - Outputs to view
extension HomePresenter: InteractorToPresenterHomeProtocol {
    func didFetchImages(with result: Result<[Image], Error>) {
        view?.indicatorView(animate: true)
        switch result {
        case .success(let images):
            self.imagesList = images
            view?.onDataFetchSuccess()
        case .failure(let error):
            view?.onDataFetchFailure(error)
        }
        view?.indicatorView(animate: false)
    }
    
    func getImageSuccess(_ image: Image) {
        router?.pushToImageDetail(on: view!, with: image)
    }
}
