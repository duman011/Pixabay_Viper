//
//  HomeRouter.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit


final class HomeRouter:  PresenterToRouterHomeProtocol {
    
    typealias PresenterProtocol =  ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol
    
    static func createModule() -> UIViewController {
        print("HomeRouter creates the Home module.")
        
        let viewController = HomeVC()
    
        let presenter: PresenterProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    func pushToImageDetail(on view: PresenterToViewHomeProtocol, with image: Image) {
        print("HomeRouter is instructed to push HomeDetailViewController onto the navigation stack.")
        let imageDetailViewController = ImageDetailRouter.createModule(with: image)
            
        let viewController = view as! HomeVC
        viewController.navigationController?.pushViewController(imageDetailViewController, animated: true)
    }
}




