//
//  NewsAPIResponse.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation

struct NewsAPIResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [News]?
}

struct News: Codable, Hashable {
    let source: NewsSource?
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
    var imageURL: URL? {
        if let urlToImage {
            return URL.init(string: urlToImage)
        }
        return nil
    }
    
    var newsURL: URL? {
        if let url {
            return URL.init(string: url)
        }
        return nil
    }
}

struct NewsSource: Codable, Hashable {
    let id: String?
    let name: String?
}
