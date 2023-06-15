//
//  Storyboard.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import UIKit

enum Storyboard: String {
  case main = "Main"
  
  var instance: UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: nil)
  }
  
  func controller<T: UIViewController>() -> T {
    guard let vc = instance.instantiateViewController(withIdentifier: T.identifier) as? T else {
      fatalError("Storyboard ID is not same as \(T.identifier)")
    }
    return vc
  }
}
