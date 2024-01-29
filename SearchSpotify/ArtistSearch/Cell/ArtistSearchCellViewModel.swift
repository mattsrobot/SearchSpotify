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

class ArtistSearchCellViewModel {
    
    @Published private(set) var title = ""
    @Published private(set) var subtitle = ""
    @Published private(set) var image: UIImage? = nil
    
    private var imageUrl: String? = nil
    private let artist: SpotifyArtist
    
    init(artist: SpotifyArtist) {
        self.artist = artist
        title = artist.name
        subtitle = artist.genres.joined(separator: ", ")
        
        if artist.images.count > 0 {
            imageUrl = artist.images[0].url
        }
    }
    
    func placeholder() -> UIImage? {
        let guitarConfig = UIImage.SymbolConfiguration(pointSize: 38, weight: .bold, scale: .medium)
        let guitarPlaceholder = UIImage(systemName: "guitars", withConfiguration: guitarConfig)
        return guitarPlaceholder?.withTintColor(.magenta, renderingMode: .alwaysOriginal)
    }
    
    func fetchImage(completion: @escaping (_ image: UIImage?) -> Void) {
        guard let url = imageUrl else {
            completion(nil)
            
            return
        }
        
        Task.detached(priority: .medium) { [weak self] in
            
            if let imageFromCache = imageCache.object(forKey: url as NSString) {
                await MainActor.run { [weak self] in
                    guard self?.imageUrl == url else {
                        return
                    }
                    self?.image = imageFromCache
                    
                    completion(imageFromCache)

                }
    
                return
            }
            
            if let data = try? Data(contentsOf: URL(string: url)!) {
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url as NSString)
                    
                    guard self?.imageUrl == url else {
                        return
                    }
                    
                    await MainActor.run { [weak self] in
                        
                        guard self?.imageUrl == url else {
                            return
                        }
                        
                        self?.image = image
                        
                        completion(image)
                    }
                }
            }
        }
    }
}
