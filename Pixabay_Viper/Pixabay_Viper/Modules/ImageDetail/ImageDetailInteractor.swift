//
//  ImageDetailInteractor.swift
//  ViperPattern
//
//  Created by Yaşar Duman on 3.12.2023.
//


final class ImageDetailInteractor: PresenterToInteractorImageDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterImageDetailProtocol?
    var image: Image?
    
    func fetchDataFromURL() {
        presenter?.dataFetchSucceeded(image: image!)
    }
}
