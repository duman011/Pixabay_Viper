//
//  HomeInteractor.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import Foundation

final class HomeInteractor: PresenterToInteractorHomeProtocol {
   
    
   
    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    var images: [Image]?

    func fetchImages(category: Category, query: String?){
        Task {
            do {
                let response = try await NetworkManager.shared.getImages(category: category, query: query)
                self.images = response
                presenter?.didFetchImages(with: .success(response))
                
            } catch {
                presenter?.didFetchImages(with: .failure(error))
            }
        }
    }
    
    func retrieveImage(at index: Int) {
        guard let images = self.images, images.indices.contains(index) else {
            print("Couldn't retrieve quote by index")
       
            return
        }
        self.presenter?.getImageSuccess(self.images![index])
    }
}
