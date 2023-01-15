//
//  URLSessionManager.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation
import Combine

final class URLSessionManager: NetworkManager, Logger {
    let session: URLSession
    var decoder: DataDecodable
    
    init(session: URLSession = URLSession.shared, decoder: DataDecodable) {
        self.session = session
        self.decoder = decoder
    }
    /// GET REQUEST:
    /// We have explicitely named it as getRequest, but it should be based on the HTTP Type provided in the param `api: TargetAPI`
    /// - Parameters:
    ///   - api: Target API provides HTTP Method(GET/POST) and endpoint URL
    func getRequest<T: Codable>(_ api: TargetAPI, responseType: T.Type) -> Future<T?, NetworkError> {
        return Future { [weak self] promise in
            self?.print(#function, " urlString: ", api.request)
            guard let url = URL.init(string: api.request) else {
                promise(.failure(.invalidURL))
                return
            }
            
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            
            let task = self?.session.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    promise(.failure(.invalidResponse))
                    return
                }
                
                if let data = data {
                    do {
                        let response = try self?.decoder.decode(responseType, from: data)
                        self?.print(#function, " response: ", response!)
                        promise(.success(response))
                    } catch {
                        self?.print(#function, " error: ", error)
                        promise(.failure(.invalidResponse))
                    }
                } else {
                    promise(.failure(.invalidResponse))
                }
            }
            task?.resume()
        }
    }
}
