//
//  Identifiable.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable where Self: AnyObject {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Identifiable {}

extension UITableViewCell: Identifiable {}

