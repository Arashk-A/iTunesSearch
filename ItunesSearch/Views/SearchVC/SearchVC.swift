//
//  SearchVC.swift
//  ItunesSearch
//
//  Created by zero on 6/14/23.
//

import UIKit

class SearchVC: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var dataService: SearchListDataService!
  @IBOutlet weak var loadingView: UIActivityIndicatorView!
  
  private let searchController = UISearchController(searchResultsController: nil)
  
  var viewModel: SearchViewModel = SearchViewModel(searchService: SearchService(apiManager: APIManager()))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Itunes Search"
    
    tableView.delegate = dataService
    tableView.dataSource = dataService
    
    dataService.viewModel = viewModel
    
    setupSearchController()
    
    viewModel.delegate = self
    
    loadingView.isHidden = true
  }


}

// MARK: - Handle UISearchController Delegate and setup
extension SearchVC: UISearchResultsUpdating {
  private func setupSearchController() {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search"
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
  
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    
    if let text = searchBar.text {
      viewModel.searchTerms = text
    }
  }
}

// MARK: - ViewModel delegate for updating UI
extension SearchVC: UpdateViewDelegate {
  func updatetableView() {
    tableView.reloadData()
  }
  
  func laoding(_ isLoading: Bool) {
    loadingView.isHidden = !isLoading
    isLoading ? loadingView.startAnimating() : loadingView.stopAnimating()
  }
  
}
