//
//  SearchViewModelTest.swift
//  ItunesSearchTests
//
//  Created by zero on 6/15/23.
//

import XCTest
@testable import ItunesSearch

@MainActor
final class SearchViewModelTest: XCTestCase {
  
  var vc: SearchVC!
  var viewModel: SearchViewModel!
  
  override func setUp() {
    let searchVC: SearchVC = Storyboard.main.controller()
    vc = searchVC
    
    viewModel = SearchViewModel(searchService: SearchServiceMock())
    vc.viewModel = viewModel
  }

  func testSearchVC_SearchViewModelShouldNotBeNill() {
    XCTAssertNotNil(vc.viewModel)
  }

  func testSearchViewModel_SearchResultsShouldNotBeNill() {
      XCTAssertNotNil(viewModel.searchResults)
  }
  
  func testSearchViewModel_SearchServiceShouldNotBeNill() {
    XCTAssertNotNil(viewModel.searchService)
  }
  
  func testViewModels_PropertiesShouldBeAtInitState() {
    XCTAssertTrue(viewModel.searchTerms.isEmpty)
    XCTAssertTrue(viewModel.searchResults.isEmpty)
  }
  
  func testViewModels_SearchTermsShouldBeUpdated() {
    viewModel.searchTerms = "Rock"
    XCTAssertFalse(viewModel.searchTerms.isEmpty)
  }
  
  func testSeacrhService_ShouldPerfomSearch() async throws {
    let result = try await viewModel.searchService.search("Rock", country: "DK")
    XCTAssertEqual(result.count, 50)
  }
  
}
