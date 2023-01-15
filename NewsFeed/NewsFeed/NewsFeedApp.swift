//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//
// PAT: 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
import SwiftUI

@main
struct NewsFeedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(networkManager: URLSessionManager(decoder: JSONDecoder())))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
