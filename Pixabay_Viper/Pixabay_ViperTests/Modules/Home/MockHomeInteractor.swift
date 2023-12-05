//
//  MockHomeInteractor.swift
//  Pixabay_ViperTests
//
//  Created by Yaşar Duman on 5.12.2023.
//

@testable import Pixabay_Viper

final class MockHomeInteractor: PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol?
    var networkManager: NetworkManagerInterface?
    
    var invokedFetchImages = false
    var invokedFetchImagesCount = 0
    
    func fetchImages(category: Category, query: String?, currentPage: Int) {
        invokedFetchImages = true
        invokedFetchImagesCount += 1
        
   
        Task {
            do {
                _ = try await networkManager?.getImages(category: category, query: query, currentPage: currentPage)
                presenter?.didFetchImages(with: .success([]))
            } catch {
                presenter?.didFetchImages(with: .failure(error))
            }
        }
    }
}

