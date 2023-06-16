# iTunes Search

The iTunes Search app is a sample application for searching on iTunes APIs. 

It is developed for iOS using the Swift and UIKit framework and follows the MVVM design pattern.
 
## Files and Folders Structure

The files and folders in this app are structured using vertical grouping rather than horizontal grouping, which means related files are grouped in the same directory instead of being separated into different folders based on file type.

The `Core` folder includes all API and Extensions directories. Each directory inside the `Views` folder contains everything necessary for that ViewController to populate itself. The `Components` directory currently has one `UIImageView` subclass for loading images asynchronously from a web service. There is a mechanism for caching images in place to reduce the API calls.

## Workflow and Functionality

- The application's entry point is inside the `SceneDelegate` file. 

## ViewControllers

### SearchVC

Currently, the app has only one view controller, and it's `SearchVC` inside the `Views` directory. Inside the SearchVC directory, there are three subdirectories: `SearchRequestService`, `SearchViewModel`, `SearchItemCell`, and two classes, `SearchVC.swift` and `SearchListDataService`.

The `SearchRequestService` directory includes files that make it possible to create requests and mock the search request for `Unit Testing` inside the test suites of the project. `SearchRequest` is compliant with the `RequestProtocol` and is in charge of creating `URLRequest`, which is used inside `APIManager` to send requests to the web server. Every outgoing request should comply with its standard.

`SearchService` has a protocol `SearchServiceProtocol` and currently has one method to get search results with the given term and country.

`SearchMockData` and `SearchServiceMock` are used for creating mock objects of actual requests and are used inside Unit Tests.

`SearchViewModel` contains logic for handling request results and sending signals to update view behavior through its delegate methods.

`SearchListDataService` implements `UITableView`'s delegate and dataSource, making it easy to write tests and also separating and isolating logic from view controllers.

### Models 

The Models directory has three files: `Storyboard`, a helper enum that is used to initiate view controllers from the storyboard without force casting; `Identifiable`, a protocol with an extension method that returns an identifier property for every class that has extended its functionality, and is also used inside `Storyboard` to retrieve view controllers; and `SearchResult`, a basic model for search items.

## Core

### API

The API directory consists of two directories and two top-level objects.

The `Parser` directory has a class with the same name that is responsible for decoding data from the request result to a given generic type.

The `Request` directory has two enums: `RequestType`, `NetworkError`, and one `RequestProtocol` as explained above.

`APIConstants` contains constant properties like the host and default country name to use throughout the app.

`APIManager` is the place where requests are sent to the web server, and the returned data will be processed, parsed, and passed down to the requester.
