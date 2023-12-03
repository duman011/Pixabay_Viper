//
//  ImageDetailRouter.swift
//  ViperPattern
//
//  Created by Yaşar Duman on 3.12.2023.
//

import UIKit

final class ImageDetailRouter: PresenterToRouterImageDetailProtocol {
    
    static func createModule(with image: Image) -> UIViewController {
        print("QuoteDetailRouter creates the QuoteDetail module.")
        let viewController = ImageDetailView()
        
        let presenter: ViewToPresenterImageDetailProtocol & InteractorToPresenterImageDetailProtocol = ImageDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ImageDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ImageDetailInteractor()
        viewController.presenter?.interactor?.image = image
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
