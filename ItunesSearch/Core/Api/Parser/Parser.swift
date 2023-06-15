//
//  Parser.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

protocol ParserProtocol {
  func parse<T: Decodable>(_ data: Data) throws -> T
}

class Parser: ParserProtocol {
  private let decoder: JSONDecoder
  
  init(decoder: JSONDecoder = JSONDecoder()) {
    self.decoder = decoder
  }
  
  func parse<T: Decodable>(_ data: Data) throws -> T {
    return try decoder.decode(T.self, from: data)
  }
}
