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

fileprivate var kArtistCellIdentifier = "ArtistCellIdentifier"

class ArtistSearchViewController: UITableViewController, UISearchResultsUpdating {
    
    var viewModel: ArtistSearchViewModel!
    private let input: PassthroughSubject<ArtistSearchViewModelInput, Never> = .init()
    private var cancellables = Set<AnyCancellable>()
    
    private var searchController: UISearchController!
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        navigationItem.title = String(localized: "ArtistSearchTitle")
        tableView.register(ArtistSearchCell.self, forCellReuseIdentifier: kArtistCellIdentifier)
    }
    
    private func setupBindings() {
        let output = viewModel.transform(input: input.eraseToAnyPublisher())
        output
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                switch event {
                case .fetchArtistsDidSucceed:
                    self?.tableView.reloadData()
                case .fetchArtistsDidFail(let error):
                    let alert = UIAlertController(title: String(localized: "Error"), message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: String(localized: "Ok"), style: .default, handler: nil))
                    self?.present(alert, animated: true)
                    break
                case .toggleLoading:
                    break
                }
            }.store(in: &cancellables)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
}

// UISearchResultsUpdating

extension ArtistSearchViewController {
    func updateSearchResults(for searchController: UISearchController) {
        input.send(.searchInputChanged(query: searchController.searchBar.text ?? ""))
    }
}

// UITableViewDataSource

extension ArtistSearchViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = viewModel.artistDetailViewModel(for: indexPath)!
        let detailController = ArtistDetailViewController()
        detailController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: detailController)
        navigationController.navigationBar.barStyle = .black
        present(navigationController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kArtistCellIdentifier, for: indexPath) as! ArtistSearchCell
        let viewModel = viewModel.artistSearchCellViewModel(for: indexPath)!
        cell.viewModel = viewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.rowHeight(for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
}


