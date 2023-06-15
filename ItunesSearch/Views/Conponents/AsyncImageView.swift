//
//  AsyncImageView.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import UIKit

private let imageCache = NSCache<NSString, AnyObject>()

@MainActor
class AsyncImageView: UIImageView {
  
  private let activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.color = .darkGray
    return indicator
  }()
  
  func load(_ path: String) {
    setupIndicator()
    image = nil
    activityIndicator.startAnimating()

    if let image = imageCache.object(forKey: path as NSString) as? UIImage {

      self.image = image
      activityIndicator.stopAnimating()
      return
    }

    fetch(path)
  }
  
  private func fetch(_ path: String) {
    guard let url = URL(string: path) else { return }

    Task {
      do {
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        activityIndicator.stopAnimating()
        
        if let image = UIImage(data: data) {
          imageCache.setObject(image, forKey: path as NSString)
          self.image = image
        }
      } catch {

      }
    }
  }
  
  private func setupIndicator() {
    addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
}
