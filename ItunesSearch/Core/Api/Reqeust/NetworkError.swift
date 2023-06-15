//
//  NetworkError.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
    
  var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
      
    case .invalidURL:
      return "URL string is malformed."
      
    }
  }
}
