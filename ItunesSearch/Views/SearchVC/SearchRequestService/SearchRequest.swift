//
//  SearchRequest.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

enum SearchRequest: RequestProtocol {
  case terms(text: String, country: String?)
  
  var path: String {
    return "/seach"
  }
  
  var requestType: RequestType {
    .Get
  }
  
  var urlParams: [String : String?] {
    switch self {
      case .terms(let term, let country):
        return getSearchParams(term, country: country)
    }
  }

}

// MARK: - Private handler
extension SearchRequest {
  private func getSearchParams(_ term: String, country: String?) -> [String: String?] {
    var params: [String: String?] = [:]
    
    if let country {
      params["country"] = country
    }
    return params
  }
}
