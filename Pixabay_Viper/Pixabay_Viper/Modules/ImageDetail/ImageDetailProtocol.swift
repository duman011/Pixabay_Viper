//
//  ImageDetailProtocol.swift
//  ViperPattern
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterImageDetailProtocol: AnyObject {
    var view: PresenterToViewImageDetailProtocol? { get set }
    var interactor: PresenterToInteractorImageDetailProtocol? { get set }
    var router: PresenterToRouterImageDetailProtocol? { get set }
    func viewDidLoad()
    
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewImageDetailProtocol: AnyObject {
    func onGetDataFromURLSuccess(_ image: Image)
    func onGetDataFromURLFailure(_ image: Image)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorImageDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterImageDetailProtocol? { get set }
    var image: Image? { get set }
    func fetchDataFromURL()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterImageDetailProtocol: AnyObject {
    func dataFetchSucceeded(image: Image)
    func dataFetchFailure(image: Image)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterImageDetailProtocol: AnyObject {
    static func createModule(with image: Image) -> UIViewController
}
