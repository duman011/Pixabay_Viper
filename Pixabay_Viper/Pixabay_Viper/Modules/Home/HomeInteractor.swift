//
//  HomeInteractor.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import Foundation

final class HomeInteractor: PresenterToInteractorHomeProtocol {
   
    
   
    // MARK: Properties
    weak var presenter: InteractorToPresenterHomeProtocol?
    var images: [Image]?

    func fetchImages(){
        Task {
            do {
                let response = try await NetworkManager.shared.getImages()
                self.images = response
                presenter?.fetchImagesSuccess(response)
                
            } catch {
                presenter?.fetchImagesFailure(error)
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
