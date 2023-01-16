//
//  MockNetworkManager.swift
//  NewsFeedTests
//
//  Created by Bista, Umang (623-Extern) on 16/01/23.
//

import Foundation
import Combine
import XCTest

@testable import NewsFeed

final class MockNetworkManager: NetworkManager {
    var decoder: NewsFeed.DataDecodable
    var testCase: APITestStubFile
    
    init(decoder: NewsFeed.DataDecodable, testCase: APITestStubFile) {
        self.decoder = decoder
        self.testCase = testCase
    }
    
    func getRequest<T>(_ api: NewsFeed.TargetAPI, responseType: T.Type) -> Future<T?, NewsFeed.NetworkError> where T : Decodable, T : Encodable {
        return Future { promise in
            do {
                let response = try self.decoder.decode(responseType, from: self.testCase.response)
                print(String(describing: Self.self), " response: ", response)
                promise(.success(response))
            } catch {
                promise(.failure(.invalidResponse))
            }
        }
    }
}


protocol APITestStubFile {
    var response: Data { get }
}

enum NewsAPITestCase: APITestStubFile {
    case fetchHeadlines
    
    var response: Data {
        switch self {
        case .fetchHeadlines:
            return loadStub(name: "newTopHeadlines", ext: "json")
        }
    }
    
    func loadStub(name: String, ext: String) -> Data {
        
        @objc class TestClass: NSObject { }
        
        // Obtain Reference to Bundle
        let bundle = Bundle(for: TestClass.self)
        
        // Ask Bundle for URL of Stub
        let url = bundle.url(forResource: name, withExtension: ext)
        
        // Use URL to Create Data Object
        return try! Data(contentsOf: url!)
    }
}
