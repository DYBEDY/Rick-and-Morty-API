//
//  RickAndMorty.swift
//  Rick and Morty API
//
//  Created by Roman on 18.01.2022.
//

import Foundation




struct RickAndMorty: Decodable {
    let results: [Results]?
}

struct Results: Decodable{
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin: Location?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct AllinfoAboutMorty: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}


struct Location: Decodable {
    let name: String?
    let url: String?
}



