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
    
    var imagesList: [Image] { get set }
    var selectedCategory: Category { get set }
    var currentPage: Int { get set }
    var searchText: String { get set}
    
    func removeLastResults()
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func didSelectRow(at index: Int)
    
    func searchImages()
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: AnyObject {
    func onDataFetchSuccess()
    func onDataFetchFailure(_ error: Error?)
    func indicatorView(animate: Bool)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol: AnyObject {
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    func fetchImages(category: Category, query: String?, currentPage: Int)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol: AnyObject {
    func didFetchImages(with result: Result<[Image], Error>)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: AnyObject {
    static func createModule() -> UIViewController
    
    func pushToImageDetail(on view: PresenterToViewHomeProtocol, with image: Image)
}
