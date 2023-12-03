//
//  ImageDetailPresenter.swift
//  ViperPattern
//
//  Created by Yaşar Duman on 3.12.2023.
//

import Foundation


final class ImageDetailPresenter: ViewToPresenterImageDetailProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewImageDetailProtocol?
    var interactor: PresenterToInteractorImageDetailProtocol?
    var router: PresenterToRouterImageDetailProtocol?
    
    func viewDidLoad() {
        interactor?.fetchDataFromURL()
    }
 
}

extension ImageDetailPresenter: InteractorToPresenterImageDetailProtocol {
   
    func dataFetchSucceeded(image: Image) {
        print("Presenter receives the result from Interactor after it's done its job.")

        view?.onGetDataFromURLSuccess(image)
    }
    
    func dataFetchFailure(image: Image) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onGetDataFromURLFailure(image)
    }
    
    
  
    
}
