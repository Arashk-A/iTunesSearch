//
//  AsyncImageView.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import UIKit

@MainActor
class AsyncImageView: UIImageView {
  let cache = ImageCache.shared
  
  private let activityIndicator: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.color = .darkGray
    return indicator
  }()
  
  func load(_ path: String) {
    setupIndicator()
    image = nil
    activityIndicator.startAnimating()

    if let image = cache.getImage(forKey: path) {

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
          cache.setImage(image, forKey: path)
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
