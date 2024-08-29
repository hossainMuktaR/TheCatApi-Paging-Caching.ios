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
    
    var state = CatListState()
    
    init() {
        self.repository = CatRepositoryImpl(api: self.api)
        self.getImageUseCase = GetImagesUseCase(repository: self.repository)
    }
    
    func getImages() {
        Task {
            let result = await getImageUseCase.execute(page: 1, limit: 40)
            switch(result) {
            case .loading :
                print("vm: getCoins: .loading Called")
                self.state = CatListState(isLoading: true)
            case .failure(let e) :
                self.state = CatListState(isLoading: false, error: e)
                print("vm: getCoins: .failure Called")
            case .success(let cat):
                self.state = CatListState(isLoading: false, cat: cat, error: "")
                print("vm: getCoins: .success Called")
                print("vm: getCoins: .success: \(cat.count)")
            }
        }
    }
}
