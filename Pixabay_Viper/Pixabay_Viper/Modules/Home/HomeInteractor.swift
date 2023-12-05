//
//  HomeInteractor.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


final class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    
    func fetchImages(category: Category, query: String?, currentPage: Int) {
        Task {
            do {
                let response = try await NetworkManager.shared.getImages(category: category, query: query, currentPage: currentPage)
                presenter?.didFetchImages(with: .success(response))
            } catch {
                presenter?.didFetchImages(with: .failure(error))
            }
        }
    }
}
