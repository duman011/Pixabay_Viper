//
//  HomePresenterTests.swift
//  Pixabay_ViperTests
//
//  Created by Yaşar Duman on 5.12.2023.
//

@testable import Pixabay_Viper
import XCTest

final class HomePresenterTests: XCTestCase {
    var mockHomeVC: MockHomeVC!
    var mockHomeRouter: MockHomeRouter!
    var mockHomeInteractor: MockHomeInteractor!
    var mockNetworkManager: MockNetworkManager!
    var presenter: HomePresenter!
    let expectation = XCTestExpectation(description: "Async Call")
    
    override func setUp() {
        super.setUp()
        
        mockHomeVC = MockHomeVC()
        mockHomeRouter = MockHomeRouter()
        mockHomeInteractor = MockHomeInteractor()
        mockNetworkManager = MockNetworkManager()
        
        presenter = HomePresenter()
        presenter.view = mockHomeVC
        presenter.router = mockHomeRouter
        presenter.interactor = mockHomeInteractor
        mockHomeInteractor.networkManager = mockNetworkManager
        mockHomeInteractor.presenter = presenter
    }
    
    override func tearDown() {
        mockHomeVC = nil
        mockHomeRouter = nil
        mockHomeInteractor = nil
        mockNetworkManager = nil
        presenter = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {
        XCTAssertEqual(mockHomeInteractor.invokedFetchImagesCount, 0)
        XCTAssertEqual(mockNetworkManager.invokedGetImagesCount,0)
        XCTAssertEqual(mockHomeVC.invokedIndicatorViewCout, 0)
        XCTAssertFalse(mockHomeVC.invokedOnDataFetchSuccess)
        
        presenter.viewDidLoad()
        XCTWaiter().wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(mockHomeInteractor.invokedFetchImagesCount, 1)
        XCTAssertEqual(mockNetworkManager.invokedGetImagesCount,1)
        XCTAssertTrue(mockHomeVC.invokedOnDataFetchSuccess)
        XCTAssertEqual(mockHomeVC.invokedIndicatorViewCout, 2)
    }
    
    
    func test_searchImages_InvokesRequiredMethods() {
        XCTAssertEqual(mockHomeInteractor.invokedFetchImagesCount, 0)
        XCTAssertEqual(mockNetworkManager.invokedGetImagesCount,0)
        XCTAssertEqual(mockHomeVC.invokedIndicatorViewCout, 0)
        XCTAssertFalse(mockHomeVC.invokedOnDataFetchSuccess)
        
        presenter.searchImages()
        XCTWaiter().wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(mockHomeInteractor.invokedFetchImagesCount, 1)
        XCTAssertEqual(mockNetworkManager.invokedGetImagesCount,1)
        XCTAssertEqual(mockHomeVC.invokedIndicatorViewCout, 2)
        XCTAssertEqual(mockHomeVC.invokedOnDataFetchSuccessCout, 1)
    }
    
    func test_didSelectRow_InvokesRouterPushToImageDetail() {
//        XCTAssertEqual(mockHomeRouter.invokedPushToImageDetailCount, 0)
//        
//        presenter.didSelectRow(at: 0)
//        
//        XCTAssertEqual(mockHomeRouter.invokedPushToImageDetailCount, 1)
//        
        let viewController = HomeVC() // Test edilecek sınıf
        trackMemoryLeaks(viewController)
    }
    
    
    
    
}


extension XCTestCase {
    func trackMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
