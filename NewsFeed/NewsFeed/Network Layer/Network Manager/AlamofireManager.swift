//
//  AlamofireManager.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation
//import Alamofire

/* Incase if alamofire is used*/
/*
final class AlamofireManager: NetworkManager {
    var decoder: DataDecodable
    
    init(decoder: DataDecodable) {
        self.decoder = decoder
    }
    
    
    /// GET REQUEST:
    /// We have explicitely named it as getRequest, but it should be based on the HTTP Type provided in the param `api: TargetAPI`
    /// - Parameters:
    ///   - api: Target API provides HTTP Method(GET/POST) and endpoint URL
    func getRequest<T: Codable>(_ api: TargetAPI, responseType: T.Type, completionHandler: @escaping (Swift.Result<T?, NetworkError>) -> Void) {
        print(String(describing: Self.self), " urlString: ", api.url)
        guard Reach().isNetworkReachable() else {
            completionHandler(.failure(.noInternet))
            return
        }
        
        Alamofire.request(api.url).response { (response) in
            guard let responseData = response.data else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            do {
                let response = try self.decoder.decode(responseType, from: responseData)
                print(String(describing: Self.self), " response: ", response)
                completionHandler(.success(response))
            } catch {
                completionHandler(.failure(.invalidResponse))
            }
        }
    }
}
*/
