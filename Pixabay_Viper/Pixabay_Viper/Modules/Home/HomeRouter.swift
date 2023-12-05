//
//  HomeRouter.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit

final class HomeRouter:  PresenterToRouterHomeProtocol {
    
    typealias PresenterProtocols =  ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol
    
    static func createModule() -> UIViewController {
        let viewController = HomeVC()
        
        let presenter: PresenterProtocols = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    func pushToImageDetail(on view: PresenterToViewHomeProtocol, with image: Image) {
        let imageDetailViewController = ImageDetailRouter.createModule(with: image)
        
        let viewController = view as! HomeVC
        viewController.navigationController?.pushViewController(imageDetailViewController, animated: true)
    }
}




