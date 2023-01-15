//
//  HomeViewModel.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published
    var headlines = [News]()
    
    var disposeBag = Set<AnyCancellable>()
    
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchTopHeadlines() {
        networkManager.getRequest(NewsAPI.topHeadlines, responseType: NewsAPIResponse.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(#function, " error: ", error.localizedDescription)
                }
            } receiveValue: { response in
                self.headlines = response?.articles ?? []
            }.store(in: &self.disposeBag)
    }
}
