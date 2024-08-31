//
//  CatListState.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import Foundation

struct CatListState {
    var isLoading: Bool = false
    var cat: [Cat] = []
    var error: String? = nil
}
