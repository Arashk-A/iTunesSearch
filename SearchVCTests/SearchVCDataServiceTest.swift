//
//  SearchVCDataServiceTest.swift
//  ItunesSearchTests
//
//  Created by zero on 6/15/23.
//

import XCTest
@testable import ItunesSearch

@MainActor
final class SearchVCDataServiceTest: XCTestCase {
  
  var dataService: SearchListDataService!
  var tableView: UITableView!
  
  override func setUp() {
    dataService = SearchListDataService()
    
    tableView = UITableView()
    
    tableView.dataSource = dataService
    tableView.delegate = dataService
    
    dataService.viewModel = SearchViewModel(searchService: SearchServiceMock())
  }
  
  func testDataService_ViewModelShouldNotBeNill() {
    XCTAssertNotNil(dataService.viewModel)
  }
  
  func testNumberOfRows_ShouldBeZeroInStart() {
    let numberOfRows = tableView.numberOfRows(inSection: 0)
    XCTAssertEqual(numberOfRows, 0)
  }
    
  func testNumberOfRows_ShouldEqualToSearchResultsCount() {
    dataService.viewModel?.searchResults.append(
      SearchItem(
        artistName: "Volbeat", trackName: "We",
        artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Music/49/b7/d3/mzi.wwregpql.jpg/100x100bb.jpg",
        releaseDate: "2008-09-01T07:00:00Z", country: "DNK", shortDescription: "Capitol Policeman John Cale (Channing Tatum) has just been denied his dream job with the Secret")
    )
    
    let numberOfRows = tableView.numberOfRows(inSection: 0)
    XCTAssertEqual(numberOfRows, 1)
  }
  
}
