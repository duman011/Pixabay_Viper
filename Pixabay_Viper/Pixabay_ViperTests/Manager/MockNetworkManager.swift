//
//  MockNetworkManager.swift
//  Pixabay_ViperTests
//
//  Created by Yaşar Duman on 5.12.2023.
//

@testable import Pixabay_Viper
import UIKit

final class MockNetworkManager: NetworkManagerInterface {
    
    var invokedGetImages = false
    var invokedGetImagesCount = 0
    var getImagesResult: [Image] = []
    
    func getImages(category: Pixabay_Viper.Category, query: String?, currentPage: Int) async throws -> [Pixabay_Viper.Image] {
        invokedGetImages = true
        invokedGetImagesCount += 1
        return getImagesResult
    }
    
    var invokedDownloadImage = false
    var invokedDownloadImageCount = 0
    var downloadImageResult: UIImage? = nil
    
    func downloadImage(from urlString: String) async -> UIImage? {
        invokedDownloadImage = true
        invokedDownloadImageCount += 1
        return downloadImageResult
    }
}

