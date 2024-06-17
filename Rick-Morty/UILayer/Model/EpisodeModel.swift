//
//  EpisodeModel.swift
//  Rick-Morty
//
//  Created by July Belova on 28.04.2024.
//

import UIKit

struct MainModel {
    let image: String
    let name: String
    let episode: [String]
}

//struct EpisodeModel{
//    let result: [Episode]
//}
//
//struct Episode: Decodable {
//    let id: String
//    let fofo: Data
//    let name: String
//    let gender: String
//    let status:String
//    let specie: String
//    let origin: String
//    let type: String
//    let location: String
//}


struct CharacterResponse: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let type: String
    let gender: Gender
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
