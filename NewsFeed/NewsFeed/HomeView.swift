//
//  HomeView.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openURL
    
    @StateObject
    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle(Text("Top Headlines"))
        }
        .onAppear {
            viewModel.fetchTopHeadlines()
        }
    }
    
    var content: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.headlines, id: \.self) { news in
                    NewsListRow(news: news)
                        .frame(maxHeight: 200)
                        .onTapGesture {
                            if let url = news.newsURL {
                                openURL(url)
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct NewsListRow: View {
    var news: News
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let url = news.imageURL {
                    AsyncImage(url: url, content: { image in
                        image.resizable()
                            .frame(width: 50, height: 50)
                    }, placeholder: {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 50, height: 50)
                    })
                }
                
                VStack(alignment: .leading) {
                    Text(news.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    
                    
                    if let author = news.author {
                        Text("By \(author)")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .frame(height: 50)
            
            if let desc = news.description {
                Text(desc)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
