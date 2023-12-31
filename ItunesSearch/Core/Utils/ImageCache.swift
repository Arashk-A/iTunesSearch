//
//  ImageCache.swift
//  ItunesSearch
//
//  Created by zero on 6/16/23.
//

import UIKit

class ImageCache {
  static let shared = ImageCache()
  
  private let cache = NSCache<NSString, UIImage>()
  
  private init() {}
  
  func setImage(_ image: UIImage, forKey key: String) {
      cache.setObject(image, forKey: key as NSString)
  }
  
  func getImage(forKey key: String) -> UIImage? {
      return cache.object(forKey: key as NSString)
  }
}
