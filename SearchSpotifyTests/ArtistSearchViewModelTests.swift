//
// Copyright 2024 Matthew Wilkinson
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//


import XCTest
import Combine

@testable import SearchSpotify

final class ArtistSearchViewModelTests: XCTestCase {

    func testAValidResponse() throws {
        // A mocked service returning a valid response
        let service = MockSpotifyService(fakeResponse: kMetalicaResponse)
        
        // Setup a view model with our mock service
        let viewModel = ArtistSearchViewModel(spotifyService: service)
        var cancellables = Set<AnyCancellable>()
        let input: PassthroughSubject<ArtistSearchViewModelInput, Never> = .init()
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        
        // Set the expectations
        let expectation = XCTestExpectation(description: "Should fetch artists")
        expectation.expectedFulfillmentCount = 3
        expectation.assertForOverFulfill = true
        
        output
            .receive(on: DispatchQueue.main)
            .sink { event in
                switch event {
                case .fetchArtistsDidSucceed:
                    XCTAssertTrue(viewModel.numberOfRows == 20)
                    XCTAssertTrue(viewModel.numberOfSections == 1)
                    expectation.fulfill()
                case .fetchArtistsDidFail:
                    XCTFail("Should not of thrown an error")
                case .toggleLoading:
                    expectation.fulfill()
                }
            }.store(in: &cancellables)
        
        // Assert the content returned is expected initially
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertTrue(viewModel.numberOfSections == 1)
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 1, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 1)))

        // Search for something
        input.send(.searchInputChanged(query: "Something"))
        
        // Wait (shouldn't be long since it's mocked data)
        wait(for: [expectation], timeout: 1.0)
        
        // Assert the content returned is expected after
        XCTAssertTrue(viewModel.numberOfRows == 20)
        XCTAssertTrue(viewModel.numberOfSections == 1)
        XCTAssertNotNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNotNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 19, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 1)))
    }
    
    func testAWeirdResponse1() throws {
        // A mocked service returning a weird response
        let service = MockSpotifyService(fakeResponse: kWeirdResponse1)
        
        // Setup a view model with our mock service
        let viewModel = ArtistSearchViewModel(spotifyService: service)
        var cancellables = Set<AnyCancellable>()
        let input: PassthroughSubject<ArtistSearchViewModelInput, Never> = .init()
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        
        // Set the expectations
        let expectation = XCTestExpectation(description: "Should show an error")
        expectation.expectedFulfillmentCount = 3
        expectation.assertForOverFulfill = true
        
        output
            .receive(on: DispatchQueue.main)
            .sink { event in
                switch event {
                case .fetchArtistsDidSucceed:
                    XCTFail("Should not of succeeded")
                case .fetchArtistsDidFail:
                    XCTAssertTrue(viewModel.numberOfRows == 0)
                    XCTAssertTrue(viewModel.numberOfSections == 1)
                    expectation.fulfill()
                case .toggleLoading:
                    XCTAssertTrue(viewModel.numberOfRows == 0)
                    XCTAssertTrue(viewModel.numberOfSections == 1)
                    expectation.fulfill()
                }
            }.store(in: &cancellables)
        
        // Assert the content returned is expected initially
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertTrue(viewModel.numberOfSections == 1)
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 1, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 1)))
        
        // Search for something
        input.send(.searchInputChanged(query: "Something"))
        
        // Wait (shouldn't be long since it's mocked data)
        wait(for: [expectation], timeout: 1.0)
        
        // Assert the content returned is expected after
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertTrue(viewModel.numberOfSections == 1)
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 1, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 1)))
    }
    
    func testAWeirdResponse2() throws {
        // A mocked service returning a weird response
        let service = MockSpotifyService(fakeResponse: kWeirdResponse2)
        
        // Setup a view model with our mock service
        let viewModel = ArtistSearchViewModel(spotifyService: service)
        var cancellables = Set<AnyCancellable>()
        let input: PassthroughSubject<ArtistSearchViewModelInput, Never> = .init()
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        
        // Set the expectations
        let expectation = XCTestExpectation(description: "Should show an error")
        expectation.expectedFulfillmentCount = 3
        expectation.assertForOverFulfill = true
        
        output
            .receive(on: DispatchQueue.main)
            .sink { event in
                switch event {
                case .fetchArtistsDidSucceed:
                    XCTFail("Should not of succeeded")
                case .fetchArtistsDidFail:
                    XCTAssertTrue(viewModel.numberOfRows == 0)
                    XCTAssertTrue(viewModel.numberOfSections == 1)
                    expectation.fulfill()
                case .toggleLoading:
                    XCTAssertTrue(viewModel.numberOfRows == 0)
                    XCTAssertTrue(viewModel.numberOfSections == 1)
                    expectation.fulfill()
                }
            }.store(in: &cancellables)
        
        // Assert the content returned is expected initially
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertTrue(viewModel.numberOfSections == 1)
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 1, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 1)))
        
        // Search for something
        input.send(.searchInputChanged(query: "Something"))
        
        // Wait (shouldn't be long since it's mocked data)
        wait(for: [expectation], timeout: 1.0)
        
        // Assert the content returned is expected after
        XCTAssertTrue(viewModel.numberOfRows == 0)
        XCTAssertTrue(viewModel.numberOfSections == 1)
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 1, section: 0)))
        XCTAssertNil(viewModel.artistSearchCellViewModel(for: IndexPath(row: 0, section: 1)))
    }

}
