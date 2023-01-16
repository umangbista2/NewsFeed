//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import XCTest

@testable import NewsFeed
final class NewsFeedTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAPIResponse() {
        let networkManager = MockNetworkManager(decoder: JSONDecoder(), testCase: NewsAPITestCase.fetchHeadlines)
        let viewModel = HomeViewModel.init(networkManager: networkManager)
        
        let expectation = XCTestExpectation(description: #function)

        viewModel.fetchTopHeadlines()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
        XCTAssertTrue(!viewModel.headlines.isEmpty)
    }
}
