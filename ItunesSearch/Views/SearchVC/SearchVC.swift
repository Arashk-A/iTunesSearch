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
  
  var viewModel: SearchViewModel = SearchViewModel(searchService: SearchService(apiManager: APIManager()))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    tableView.delegate = dataService
    tableView.dataSource = dataService
  }


}

