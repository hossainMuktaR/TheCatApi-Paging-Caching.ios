//
//  CatRepositoryImpl.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 29/8/24.
//

import Foundation

class CatRepositoryImpl: CatRepository {
    private let api: CatApiService
    
    init(api: CatApiService) {
        self.api = api
    }
    
    func getImages(page: Int, limit: Int) async throws -> [Cat] {
        return try await api.getImages(page: page, limit: limit)
    }
}
