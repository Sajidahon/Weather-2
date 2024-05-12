//
//  SearchResultModel.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 05.05.2024.
//

import Foundation

struct SearchResult: Decodable {
    let results: [SearchResultModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct SearchResultModel: Decodable {
    let screenshotUrls: [String]
    let artworkUrl100: String
    let description: String
    let trackId: Int //appId
    let trackName: String
    let artistName: String
    
    enum CodingKeys: String, CodingKey {
        case screenshotUrls, artworkUrl100, description, trackId, trackName, artistName
    }
}
