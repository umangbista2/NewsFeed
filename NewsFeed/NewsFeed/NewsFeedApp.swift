//
//  NewsFeedApp.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import SwiftUI

@main
struct NewsFeedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
