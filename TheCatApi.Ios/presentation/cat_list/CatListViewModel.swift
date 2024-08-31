//
//  CatListViewModel.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import Foundation

@Observable
class CatListViewModel {
    private let api: CatApiService = CatApiServiceImpl()
    private let repository: CatRepository
    private let getImageUseCase: GetImagesUseCase
    
    var cat: [Cat] = []
    var isLoading = false
    var error: String? = nil
    // pagination state
    private var canLoadMorePages = true
    private var page = 1
    private var limit = 15
    
    init() {
        self.repository = CatRepositoryImpl(api: self.api)
        self.getImageUseCase = GetImagesUseCase(repository: self.repository)
    }
    
    func getImages() {
        guard !isLoading && canLoadMorePages else { return }
        self.isLoading = true
        Task {
            let result = await getImageUseCase.execute(page: page, limit: limit)
            
            DispatchQueue.main.async {
                
                switch(result) {
                case .loading :
                    print("vm: getCoins: .loading Called")
                    self.isLoading = true
                case .failure(let e) :
                    self.isLoading = false
                    self.error = e
                    print("vm: getCoins: .failure Called")
                case .success(let cat):
                    
                    self.cat.append(contentsOf: cat)
                    if cat.count < self.limit {
                        self.canLoadMorePages = false
                    }
                    self.page += 1
                    print("vm: getCoins: .success Called")
                    print("vm: getCoins: .success: \(self.page)")
                    self.isLoading = false
                    print("isloading = false")
                }
            }
        }
    }
}
