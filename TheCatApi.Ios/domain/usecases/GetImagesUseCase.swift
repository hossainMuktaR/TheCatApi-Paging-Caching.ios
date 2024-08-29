//
//  GetImagesUseCase.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import Foundation

class GetImagesUseCase {
    private let repository: CatRepository
    
    init(repository: CatRepository) {
        self.repository = repository
    }
    func execute(page: Int, limit: Int) async -> Resource<[Cat]> {
        
        do {
            let cat = try await repository.getImages(page: page, limit: limit)
            return .success(cat)
        } catch {
            return .failure(error.localizedDescription)
        }
    }
}
