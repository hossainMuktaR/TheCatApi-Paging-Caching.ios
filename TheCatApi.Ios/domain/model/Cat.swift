//
//  Cat.swift
//  TheCatApi.Ios
//
//  Created by Hossain Muktar on 29/8/24.
//

import Foundation

struct Cat: Codable {
    let breeds: [Breed]
    let id: String
    let url: String
    let width: Int
    let height: Int
    
    static let example: Cat = Cat(breeds: [Breed(id: "1", name: "York Chocolate", temperament: "Playful, Social, Intelligent, Curious, FriendlyC", origin: "United States", lifeSpan: "13 - 15", wikipediaURL: nil, description: "York Chocolate cats are known to be true lap cats with a sweet temperament. They love to be cuddled and petted. Their curious nature makes them follow you all the time and participate in almost everything you do, even if it's related to water: unlike many other cats, York Chocolates love it.")], id: "1", url: "https://Google.com", width: 1080, height: 720)
}

struct Breed: Codable {
    let id: String
    let name: String
    let temperament: String
    let origin: String
    let lifeSpan: String
    let wikipediaURL: String?
    let description: String

    enum CodingKeys: String, CodingKey {
        case id, name, temperament, origin, description
        case lifeSpan = "life_span"
        case wikipediaURL = "wikipedia_url"
    }
}
