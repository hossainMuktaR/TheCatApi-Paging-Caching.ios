//
//  Constant.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 30/8/24.
//

import Foundation

struct Constant {
    static let API_KEY = getApiKey()
}

func getApiKey() -> String? {
    if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
       let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any] {
        return dictionary["API_KEY"] as? String
    }
    return nil
}
