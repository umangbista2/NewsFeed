//
//  NewsAPI.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation

/// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=21e1450d11c3427694e8bd4be635f001

enum NewsAPI: TargetAPI {
    case topHeadlines
    
    /// Can be based on environment
    /// Production, Development, QA, Staging
    var baseURL: String {
        switch AppEnvironment.current {
        case .production:
            return "https://newsapi.org/v2/"
        case  .staging:
            return "https://newsapi.org/v2/"
        }
    }
    
    /// The paramters should be passed based on the GET/POST HTTP Method Type
    /// But for the sake of demo,  added params to the URL assuming to be of GET type
    var url: String {
        switch self {
        case .topHeadlines:
            return baseURL + "top-headlines"
        }
    }
    
    var method: APIMethod {
        switch self {
        case .topHeadlines:
            return .get
        }
    }
    
    var request: String {
        switch self {
        case .topHeadlines:
            return url + "?" + params.queryString
        }
    }
        
    var params: [String: String] {
        switch self {
        case .topHeadlines:
            return [
                "country": "us",
                "category": "business",
                "apiKey": "21e1450d11c3427694e8bd4be635f001"
            ]
        }
    }
}



extension Dictionary where Key : StringProtocol, Value : StringProtocol {
    var queryString: String {
        self.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}
