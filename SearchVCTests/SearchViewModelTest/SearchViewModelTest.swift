//
//  SearchViewModelTest.swift
//  ItunesSearchTests
//
//  Created by zero on 6/15/23.
//

import XCTest
@testable import ItunesSearch

final class SearchViewModelTest: XCTestCase {
  
  var vc: SearchVC!
  
  
  override func setUp() {
    let searchVC: SearchVC = Storyboard.main.controller()
    vc = searchVC
    
  }

  func testSearchVC_SearchViewModelShouldNotBeNill() {
    XCTAssertNotNil(vc.viewModel)
  }

  func testSearchViewModel_SearchResultsShouldNotBeNill() {
    XCTAssertNotNil(vc.viewModel.searchResults)
  }
}
