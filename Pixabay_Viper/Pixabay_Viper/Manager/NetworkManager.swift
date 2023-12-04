//
//  NetworkManager.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//

import UIKit

final class NetworkManager {

    // Yaşar Duman Api Key 36801194-564b42651b6375c663397a859
    
    // MARK: - Properties
    static let shared   = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    private let decoder = JSONDecoder()
    
    
    // MARK: - Initializer
    private init() {}
    
    // MARK: - Fetch Images
    func getImages() async throws -> [Image] {
        let endpoint =  PixabayAPIEndpoint.baseURL.rawValue + PixabayAPIEndpoint.API_KEY.rawValue + PixabayAPIEndpoint.imageType.rawValue + imageType.photo.rawValue
        
        guard let url = URL(string: endpoint) else {
            throw PixabayError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PixabayError.invalidResponse
        }
        
        do {
            return try decoder.decode(ImageResponse.self, from: data).images
        } catch {
            print("Error decoding JSON: \(error)")
            throw PixabayError.invalidData
        }
    }
    
    // MARK: - Download Image
    func downloadImage(from urlString: String) async ->  UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) { return image }
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
}



