//
//  DataDecodable.swift
//  NewsFeed
//
//  Created by Bista, Umang (623-Extern) on 15/01/23.
//

import Foundation
//import XMLParsing

/// Blue-print to create data parser
protocol DataDecodable {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

/// Conform JSONDecoder to Data Parser
extension JSONDecoder: DataDecodable {
    /// Signature to decode matches to protocol requirement
}

/*
// In-case if some other decoder is used e.g. `XMLDecoder`
/// Conform XMLDecoder to Data Parser
extension XMLDecoder: DataDecodable {
    /// Signature to decode matches to protocol requirement
}
*/
