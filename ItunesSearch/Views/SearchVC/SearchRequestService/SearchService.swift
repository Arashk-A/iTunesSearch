//
//  SearchService.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

protocol SearchServiceProtocol {
  func search(_ terms: String, country: String?) async throws -> [SearchItem]
}

struct SearchService {
  let apiManager: APIManagerProtocol
}

// MARK: _ SearchServiceProtocol complient
extension SearchService: SearchServiceProtocol {
  func search(_ terms: String, country: String? = nil) async throws -> [SearchItem] {
    
    let result: SearchResult = try await apiManager.perform(
      SearchRequest.terms(text: terms, country: country)
    )
    
    return result.results
  }
}
