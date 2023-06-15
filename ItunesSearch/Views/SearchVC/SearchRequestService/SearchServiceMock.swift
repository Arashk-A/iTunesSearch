//
//  SearchServiceMock.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

struct SearchServiceMock: SearchServiceProtocol {
  func search(_ terms: String, country: String?) async throws -> [SearchItem] {
    return SearchResult.mock
  }
}
