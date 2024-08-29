//
//  CatApiServiceImpl.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 29/8/24.
//

import Foundation

class CatApiServiceImpl: CatApiService {
    private let client: UrlSessionClient
    
    init(client: UrlSessionClient = UrlSessionClient()) {
        self.client = client
    }
    
    func getImages(page: Int, limit: Int) async throws -> [Cat] {
        do {
            let url = URL(string: CatApiRoute.imageSearchEndpoint)!
            // Create the URL with query parameters
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            urlComponents.queryItems = [
                URLQueryItem(name: "has_breeds", value: "true"),
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "limit", value: String(limit))
            ]
            
            // Ensure the final URL is valid
            guard let finalURL = urlComponents.url else {
                throw URLError(.badURL)
            }
            var urlRequest = URLRequest(url: finalURL)
            urlRequest.setValue(Constant.API_KEY, forHTTPHeaderField: "x-api-key")
            return try await client.get(urlRequest: urlRequest) as [Cat]
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}
