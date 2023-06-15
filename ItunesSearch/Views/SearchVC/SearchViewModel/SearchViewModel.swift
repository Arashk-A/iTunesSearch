//
//  SearchViewModel.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

protocol UpdateViewDelegate: AnyObject {
  func updatetableView()
  func laoding(_ isLoading: Bool)
}

@MainActor
class SearchViewModel {
  var searchResults: [SearchItem] = []
  
  let searchService: SearchServiceProtocol
  
  weak var delegate: UpdateViewDelegate?
  
  var searchTerms: String = "" {
    didSet {
      search(term: searchTerms)
    }
  }
  
  init(searchService: SearchServiceProtocol) {
    self.searchService = searchService
  }
}

// MARK: - Private handler to make search request
extension SearchViewModel {
  private func search(term: String) {
    guard !term.isEmpty else {
      searchResults = []
      delegate?.updatetableView()
      return
    }
    
    delegate?.laoding(true)
    Task {
      
      do {
        let result = try await searchService.search(term, country: APIConstants.country)
        
        delegate?.laoding(false)
        searchResults = result
        delegate?.updatetableView()
          
      } catch (let error) {
        debugPrint(error.localizedDescription)
        delegate?.laoding(false)
      }
    }
  }
}
