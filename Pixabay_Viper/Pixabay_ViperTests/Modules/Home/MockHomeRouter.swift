//
//  MockHomeRouter.swift
//  Pixabay_ViperTests
//
//  Created by Yaşar Duman on 5.12.2023.
//

@testable import Pixabay_Viper
import UIKit

final class MockHomeRouter: PresenterToRouterHomeProtocol {
    
    static func createModule() -> UIViewController {
        return UIViewController() 
    }
    
    var invokedPushToImageDetail = false
    var invokedPushToImageDetailCount = 0
    var invokedPushToImageDetailParameters: (view: PresenterToViewHomeProtocol, image: Image)?
    
    func pushToImageDetail(on view: PresenterToViewHomeProtocol, with image: Image) {
        invokedPushToImageDetail = true
        invokedPushToImageDetailCount += 1
        invokedPushToImageDetailParameters = (view, image)
    }
    
}
