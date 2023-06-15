//
//  SearchListDataService.swift
//  ItunesSearch
//
//  Created by zero on 6/15/23.
//

import UIKit

class SearchListDataService: NSObject {
  var viewModel: SearchViewModel?
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchListDataService: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.searchResults.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SearchItemCell = tableView.dequeueReusableCell(for: indexPath)
    
    if let item = viewModel?.searchResults[indexPath.row] {
      cell.configView(item: item)
    }
    
    return cell
  }
  
  
}
