//
//  SearchResponse.swift
//  MusicPlayer
//
//  Created by Иван Мельников on 20/04/2021.
//  Copyright © 2021 Иван Мельников. All rights reserved.
//
import Foundation


struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}
