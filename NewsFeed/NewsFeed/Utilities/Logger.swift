//
//  Logger.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation

// MARK: Utility custom print method to print current module name
protocol Logger { }
extension Logger {
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        var items = items
        items.insert(String(describing: Self.self) + ": ", at: 0)
        Swift.print(items, separator: separator, terminator: terminator)
    }
}
