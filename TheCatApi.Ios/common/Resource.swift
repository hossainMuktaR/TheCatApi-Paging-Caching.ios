//
//  Resource.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import Foundation

enum Resource<T> {
    case loading
    case success(T)
    case failure(String)
}
