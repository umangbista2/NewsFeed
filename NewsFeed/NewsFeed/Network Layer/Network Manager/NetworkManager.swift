//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation
import Combine

protocol NetworkManager: AnyObject {
    var decoder: DataDecodable { get set }
    
    func getRequest<T: Codable>(_ api: TargetAPI, responseType: T.Type) -> Future<T?, NetworkError>
}


enum NetworkError: Error {
    case noInternet
    case invalidResponse
    case invalidURL
}
