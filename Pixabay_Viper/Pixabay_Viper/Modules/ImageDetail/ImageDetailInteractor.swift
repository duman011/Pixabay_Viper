//
//  ImageDetailInteractor.swift
//  ViperPattern
//
//  Created by Yaşar Duman on 3.12.2023.
//

import Foundation

final class ImageDetailInteractor: PresenterToInteractorImageDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterImageDetailProtocol?
    var image: Image?
    
    func fetchDataFromURL() {
        print("Interactor receives the request from Presenter to get image data from the server.")
        presenter?.dataFetchSucceeded(image: image!)
    }
}
