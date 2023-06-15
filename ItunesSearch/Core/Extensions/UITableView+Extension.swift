//
//  UITableView+Extension.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import UIKit

extension UITableView {
  func dequeueReusableCell<T: UITableViewCell>(with identifier: String = T.identifier, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
    
        return cell
    }
}
