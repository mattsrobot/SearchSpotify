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

class ArtistDetailViewController: UIViewController {
    
    var viewModel: ArtistDetailViewModel!
    
    private var stackView: UIStackView! {
        didSet {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
        }
    }
    
    private var imageView: UIImageView! {
        didSet {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 400.0)
            ])
        }
    }
    
    private var genres: UILabel! {
        didSet {
            genres.translatesAutoresizingMaskIntoConstraints = false
            genres.numberOfLines = 3
            genres.textAlignment = .center
            genres.textColor = .white
        }
    }
    
    private func setupView() {
        view.backgroundColor = .black
        stackView = UIStackView()
        imageView = UIImageView()
        genres = UILabel()
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(genres)
        view.addSubview(stackView)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
    
    private func setupBindings() {
        navigationItem.title = viewModel.title
        genres.text = viewModel.subtitle
        
        viewModel.fetchImage { [weak self] image in
            self?.imageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
}

