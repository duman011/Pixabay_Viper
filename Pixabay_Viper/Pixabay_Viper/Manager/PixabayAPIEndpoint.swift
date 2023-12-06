//
//  PixabayAPIEndpoint.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 4.12.2023.
//


// MARK: - PixabayAPIEndpoint
enum APIEndpoint: String {
    case baseURL   = "https://pixabay.com/api/?key=36801194-564b42651b6375c663397a859&image_type=photo&per_page=10"
    case query     = "&q="
    case category  = "&category="
    case page      = "&page="
}
