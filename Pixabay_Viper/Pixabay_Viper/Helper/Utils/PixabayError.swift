//
//  PixabayError.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


// MARK: - Custom Error Enum
enum PixabayError: String, Error {
    case invalidUrl             = "Url Dönüştürülemedi. Please try again."
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data received from the server was invalid Please try again."
}
