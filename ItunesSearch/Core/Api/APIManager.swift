//
//  APIManager.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

protocol APIManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class APIManager: APIManagerProtocol {
  private let urlSession: URLSession
  let parser: ParserProtocol
  
  init(urlSession: URLSession = URLSession.shared,
       parser: ParserProtocol = Parser()) {
    self.urlSession = urlSession
    self.parser = parser
  }
  
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
    let data = try await fetch(request)
    
    let obj: T = try parser.parse(data)
    
    return obj
  }
}

// MARK: - Private hepler to fetch Data from server
extension APIManager {
  private func fetch(_ request: RequestProtocol) async throws -> Data {
    let (data, response) = try await urlSession.data(for: request.createRequest())
    
    guard let httpResponce = response as? HTTPURLResponse, httpResponce.statusCode == 200 else {
      throw NetworkError.invalidServerResponse
    }
    
    return data
    
  }
}
