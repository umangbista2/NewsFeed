//
//  TargetAPI.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation


protocol TargetAPI {
    var request: String { get }
    var method: APIMethod { get }
}

enum APIMethod {
    case get, post
}

enum AppEnvironment {
    // This environment can be set on the base of app target which in turn will touch onto app config(xc config)
    static let current: AppEnvironment = .staging
    
    case production
    case staging
}
