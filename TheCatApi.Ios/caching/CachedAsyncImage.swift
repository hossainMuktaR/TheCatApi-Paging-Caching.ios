//
//  CachedAsyncImage.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 1/9/24.
//

import SwiftUI

struct CachedAsyncImage: View {
    private let url: URL?
    private let placeholder: Image
    
    @State private var loadedImage: UIImage? = nil
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.url = URL(string: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        if let image = loadedImage {
            Image(uiImage: image)
                .resizable()

        } else {
            ProgressView()
                .onAppear(perform: loadImage)
        }
    }
    
    private func loadImage() {
        guard let url = url else { return }
        
        let key = url.absoluteString
        
        if let cachedImage = ImageCache.shared.getImage(forKey: key) {
            self.loadedImage = cachedImage
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            ImageCache.shared.setImage(image, forKey: key)
            
            DispatchQueue.main.async {
                self.loadedImage = image
            }
        }
        task.resume()
    }
}
