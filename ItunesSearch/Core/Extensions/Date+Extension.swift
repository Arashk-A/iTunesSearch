//
//  Date+Extension.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import Foundation

extension Date {
  func toStringDate() -> String? {
    let formater = DateFormatter()
    formater.dateFormat = "MMM, d, yyyy"
    return formater.string(from: self)
  }
}
