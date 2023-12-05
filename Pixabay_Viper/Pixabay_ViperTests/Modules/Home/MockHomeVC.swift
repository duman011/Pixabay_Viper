//
//  MockHomeVC.swift
//  Pixabay_ViperTests
//
//  Created by Yaşar Duman on 5.12.2023.
//

@testable import Pixabay_Viper

final class MockHomeVC: PresenterToViewHomeProtocol, CategorySelectionVCDelegate {
    
    var invokedOnDataFetchSuccess = false
    var invokedOnDataFetchSuccessCout = 0
    
    func onDataFetchSuccess() {
        invokedOnDataFetchSuccess = true
        invokedOnDataFetchSuccessCout += 1
    }
    
    var invokedOnDataFetchFailure = false
    var invokedOnDataFetchFailureCout = 0
    
    func onDataFetchFailure(_ error: Error?) {
        invokedOnDataFetchFailure = true
        invokedOnDataFetchFailureCout += 1
    }
    
    var invokedIndicatorView = false
    var invokedIndicatorViewCout = 0
    
    func indicatorView(_ show: Bool) {
        invokedIndicatorView = true
        invokedIndicatorViewCout += 1
    }
    
    var invokedCategorySelected = false
    var invokedCategorySelectedCout = 0
    
    func categorySelected(_ category: Pixabay_Viper.Category) {
        invokedCategorySelected = true
        invokedCategorySelectedCout += 1
    }
}
