//
//  PixabayAPIEndpoint.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 4.12.2023.
//


// MARK: - PixabayAPIEndpoint
enum PixabayAPIEndpoint: String {
    case baseURL   = "https://pixabay.com/api/"
    case API_KEY   = "?key=36801194-564b42651b6375c663397a859"
    case imageType = "&image_type="
}

enum imageType: String, CaseIterable {
    case all          = "all"
    case photo        = "photo"
    case vector       = "vector"
    case illustration = "illustration"
}
