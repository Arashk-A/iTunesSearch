//
//  String+Extention.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

extension String {
  func toDate() -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter.date(from: self)
  }
}
