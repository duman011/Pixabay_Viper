//
//  PixabayModel.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//

import Foundation
// MARK: - ImageModel
struct ImageResponse: Codable {
    let total, totalHits: Int
    let images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case total, totalHits
        case images = "hits"
    }
}

// MARK: - Image
struct Image: Codable {
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
    let webformatURL: String
    let largeImageURL: String
    let views: Int
    let downloads, likes, comments: Int
    let userID: Int
    let user: String
    let userImageURL: String
    let collections: Int

    enum CodingKeys: String, CodingKey {
        case id, pageURL, type, tags, previewURL, webformatURL, largeImageURL, views, downloads, likes, comments
        case userID = "user_id"
        case user, userImageURL, collections
       
    }
}


