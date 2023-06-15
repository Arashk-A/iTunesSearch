//
//  SearchResult.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [SearchItem]
}

// MARK: - Result
struct SearchItem: Codable {
  let kind: String?
  let artistName: String?
  let trackName: String?
  let artworkUrl30: String?
  let artworkUrl60: String?
  let artworkUrl100: String?
  let releaseDate: String?
  let country: String?
  let description: String?
  let shortDescription: String?
  let artworkUrl600: String?
  
  
  init(kind: String? = nil, artistName: String?, trackName: String?, artworkUrl30: String? = nil, artworkUrl60: String? = nil, artworkUrl100: String?, releaseDate: String?, country: String?, description: String? = nil, shortDescription: String?, artworkUrl600: String? = nil) {
    self.kind = kind
    self.artistName = artistName
    self.trackName = trackName
    self.artworkUrl30 = artworkUrl30
    self.artworkUrl60 = artworkUrl60
    self.artworkUrl100 = artworkUrl100
    self.releaseDate = releaseDate
    self.country = country
    self.description = description
    self.shortDescription = shortDescription
    self.artworkUrl600 = artworkUrl600
  }
  
  
}

// MARK: - Handle Moc data
extension SearchResult {
  static let mock = searchItemsMock()
  
  private static func searchItemsMock() -> [SearchItem] {
    guard let url = Bundle.main.url(forResource: "SearchMocData", withExtension: "json"),
        let data = try? Data(contentsOf: url) else { return [] }
    
    let decoder = JSONDecoder()
    
    let mock = try? decoder.decode(SearchResult.self, from: data)
    
    return mock?.results ?? []
  }
}
