//
//  EpisodeModel.swift
//  Rick-Morty
//
//  Created by July Belova on 28.04.2024.
//

import UIKit

struct EpisodeModel{
    let result: [Episode]
}

struct Episode: Decodable {
    let id: String
    let fofo: Data
    let name: String
    let gender: String
    let status:String
    let specie: String
    let origin: String
    let type: String
    let location: String
}
