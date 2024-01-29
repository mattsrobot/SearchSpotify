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

import UIKit
import Combine

enum ArtistSearchViewModelInput {
    case searchInputChanged(query: String)
}

enum ArtistSearchViewModelOutput {
    case toggleLoading(isLoading: Bool)
    case fetchArtistsDidFail(error: Error)
    case fetchArtistsDidSucceed
}

class ArtistSearchViewModel {
    @Published private(set) var numberOfRows = 0
    @Published private(set) var numberOfSections = 1
    
    private let spotifyService: SpotifyServiceProtocol
    private let output: PassthroughSubject<ArtistSearchViewModelOutput, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    private var lastFetchedResult: SpotifySearchResult? {
        willSet {
            numberOfRows = newValue?.artists.items.count ?? 0
        }
    }
    
    init(spotifyService: SpotifyServiceProtocol = SpotifyService()) {
        self.spotifyService = spotifyService
    }
    
    func transform(input: AnyPublisher<ArtistSearchViewModelInput, Never>) -> AnyPublisher<ArtistSearchViewModelOutput, Never> {
        input.sink { [weak self] event in
            switch event {
            case .searchInputChanged(let query):
                self?.handleSearch(query: query)
            }
        }.store(in: &cancellables)
        
        return output.eraseToAnyPublisher()
    }
    
    private func handleSearch(query: String) {
        if query.isEmpty {
            lastFetchedResult = nil
            output.send(.fetchArtistsDidSucceed)
            return
        }
        
        output.send(.toggleLoading(isLoading: true))
        
        spotifyService.search(query: query).sink { [weak self] completion in
            self?.output.send(.toggleLoading(isLoading: false))
            
            if case .failure(let error) = completion {
                self?.output.send(.fetchArtistsDidFail(error: error))
            }
        } receiveValue: { [weak self] result in
            self?.lastFetchedResult = result
            self?.output.send(.fetchArtistsDidSucceed)
        }.store(in: &cancellables)
    }
    
    func artistSearchCellViewModel(for indexPath: IndexPath) -> ArtistSearchCellViewModel? {
        guard indexPath.section < 1 else {
            return nil
        }
        guard let lastFetchedResult = lastFetchedResult, indexPath.row < lastFetchedResult.artists.items.count else {
            return nil
        }
        
        let artist = lastFetchedResult.artists.items[indexPath.row]
        
        return ArtistSearchCellViewModel(artist: artist)
    }
    
    func artistDetailViewModel(for indexPath: IndexPath) -> ArtistDetailViewModel? {
        guard indexPath.section < 1 else {
            return nil
        }
        guard let lastFetchedResult = lastFetchedResult, indexPath.row < lastFetchedResult.artists.items.count else {
            return nil
        }
        
        let artist = lastFetchedResult.artists.items[indexPath.row]
        
        return ArtistDetailViewModel(artist: artist)
    }
    
    func rowHeight(for indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
