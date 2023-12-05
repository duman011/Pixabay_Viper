//
//  Pixabay_ViperUITests.swift
//  Pixabay_ViperUITests
//
//  Created by Yaşar Duman on 5.12.2023.
//

import XCTest

final class Pixabay_ViperUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func test_SearchBar_Invocation() {
        let searchBar = app.searchFields["searchTextField"]
        searchBar.tap()
        searchBar.typeText("Leon")
        app.keyboards.buttons["Search"].tap()
        sleep(5)
    }
    
    // TODO: - Bunun için nasıl test yazılır Erosssss !!!
    func test_Category_searchBar_Invation() {
        let searchBar = app.searchFields["searchTextField"]
    }
    
    func test_CollectionView_Pagination() {
        let collectionView = app.collectionViews.firstMatch
        XCTAssertTrue(collectionView.waitForExistence(timeout: 5), "CollectionView not found")
        
        let firstPageItemCount = collectionView.cells.count
        XCTAssertTrue(firstPageItemCount > 0, "Initial items not found in the collection view")
        
      
        collectionView.swipeUp(velocity: .init(integerLiteral: 5000))
    
        let secondPageItemCount = collectionView.cells.count
        XCTAssertTrue(secondPageItemCount > firstPageItemCount, "Second page items not loaded in the collection view")
    }
    
    func test_CollectionView_CellClickToDetail() {
        let collectionView = app.collectionViews.firstMatch
        XCTAssertTrue(collectionView.waitForExistence(timeout: 5), "CollectionView not found")
        
        let firstCell = collectionView.cells.firstMatch
        firstCell.tap()
        
        let detailView = app.otherElements["ImageDetailView"]
        XCTAssertTrue(detailView.waitForExistence(timeout: 5), "Detail view not found")
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        XCTAssertTrue(collectionView.waitForExistence(timeout: 5), "Back to collection view failed")
    }

    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
