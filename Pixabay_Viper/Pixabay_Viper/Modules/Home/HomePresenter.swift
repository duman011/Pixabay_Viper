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
    
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.fetchImages()
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
 
    func fetchImagesSuccess(_ images: [Image]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.imagesList = images
        view?.onDataFetchSuccess()
    }
    
    func fetchImagesFailure(_ error: Error?) {
        view?.onDataFetchFailure(error)
    }
    
    func getImageSuccess(_ image: Image) {
        router?.pushToImageDetail(on: view!, with: image)
    }
}
