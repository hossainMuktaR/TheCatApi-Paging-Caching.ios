//
//  CatListState.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import Foundation

struct CatListState {
    var isLoading: Bool = true
    var cat: [Cat]? = nil
    var error: String? = nil
}
