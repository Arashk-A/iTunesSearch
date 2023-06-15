//
//  RequestProtocol.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation


protocol RequestProtocol {
  var path: String { get }
  var urlParams: [String: String?] { get }
  var requestType: RequestType { get }
}


// MARK: - Extension to use on all sub inheritance
extension RequestProtocol {
  var host: String {
    APIConstants.host
  }
  
  var urlParams: [String: String?] {
    return [:]
  }
  
  func createRequest() throws -> URLRequest {
    var components = URLComponents()
    components.scheme = "https"
    components.host = host
    components.path = path
    
    if !urlParams.isEmpty {
      components.queryItems = urlParams.map {
        URLQueryItem(name: $0, value: $1)
      }
    }
    
    guard let url = components.url else {
      throw NetworkError.invalidURL
    }
    
    var request = URLRequest(url: url)
    
    request.httpMethod = requestType.rawValue
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    return request
  }
}
