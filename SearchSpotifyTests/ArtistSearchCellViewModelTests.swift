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

final class ArtistSearchCellViewModelTests: XCTestCase {

    func testValidMetalicaArtist() throws {
        
        let jsonData = kMetalicaArtist.data(using: .utf8)!
        let artist = try! JSONDecoder().decode(SpotifyArtist.self, from: jsonData)

        let viewModel = ArtistSearchCellViewModel(artist: artist)
        
        XCTAssertTrue(viewModel.title == "Metallica")
        XCTAssertTrue(viewModel.subtitle == "hard rock, metal, old school thrash, rock, thrash metal")
        
        // Set the expectations
        let expectation = XCTestExpectation(description: "Should fetch image")
        expectation.expectedFulfillmentCount = 1
        expectation.assertForOverFulfill = true
        
        viewModel.fetchImage { image in
            guard image != nil else {
                return
            }
            expectation.fulfill()
        }
        
        XCTAssertNil(viewModel.image)
        
        // Wait (fetching real data, might be flakey... consider a fake image server?)
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNotNil(viewModel.image)
    }
    
    func testBadArist() throws {
        
        let jsonData = kBadArtist.data(using: .utf8)!
        let artist = try! JSONDecoder().decode(SpotifyArtist.self, from: jsonData)

        let viewModel = ArtistSearchCellViewModel(artist: artist)
        
        // Set the expectations
        let expectation = XCTestExpectation(description: "Should fetch image, return nil")
        expectation.expectedFulfillmentCount = 1
        expectation.assertForOverFulfill = true
        
        viewModel.fetchImage { image in
            guard image != nil else {
                expectation.fulfill()
                return
            }
        }
        
        XCTAssertNil(viewModel.image)
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNil(viewModel.image)
    }

}
