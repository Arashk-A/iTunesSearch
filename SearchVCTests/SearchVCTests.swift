//
//  SearchVCTests.swift
//  SearchVCTests
//
//  Created by zero on 6/14/23.
//

import XCTest
@testable import ItunesSearch

final class SearchVCTests: XCTestCase {
  
  var searchVC: SearchVC!
  
  override func setUp() {
    super.setUp()
    
    let vc: SearchVC = Storyboard.main.controller()
    searchVC = vc
    _ = searchVC.view
  }
  
  func testSearchVC_TableViewShouldNotBeNil() {
    XCTAssertNotNil(searchVC.tableView)
  }
  
  func testViewDidLoad_SetsTableViewDelegateAndDataSource() {
    XCTAssertNotNil(searchVC.tableView.dataSource)
    XCTAssertNotNil(searchVC.tableView.delegate)
    
    XCTAssertTrue(searchVC.tableView.dataSource is SearchListDataService)
    XCTAssertTrue(searchVC.tableView.delegate is SearchListDataService)
  }
  
  func testViewDidLoad_SetsTableViewDataSourceAndDelegateToSameObject() {
    XCTAssertEqual(searchVC.tableView.delegate as! SearchListDataService, searchVC.tableView.dataSource as! SearchListDataService)
  }
  
}
