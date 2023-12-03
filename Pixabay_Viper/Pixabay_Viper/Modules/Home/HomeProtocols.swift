//
//  HomeProtocols.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol: AnyObject {
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    var imagesList: [Image]? { get set }
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func didSelectRow(at index: Int)
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: AnyObject {
    func onDataFetchSuccess()
    func onDataFetchFailure(_ error: Error?)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol: AnyObject {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func fetchImages()
    
    func retrieveImage(at index: Int)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol: AnyObject {
    func fetchImagesSuccess(_ images: [Image])
    func fetchImagesFailure(_ error: Error?)
    
    func getImageSuccess(_ image: Image)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: AnyObject {
    static func createModule() -> UIViewController
    
    func pushToImageDetail(on view: PresenterToViewHomeProtocol, with image: Image)
}
