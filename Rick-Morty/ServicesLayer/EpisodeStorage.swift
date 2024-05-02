//
//  EpisodeStorage.swift
//  Rick-Morty
//
//  Created by July Belova on 15.04.2024.
//

import Foundation

class EpisodeStorage {
     
    enum KeyUserDefaults { static let episodesDataKey = "savedEpisode" }
    
    //MARK: - Properties
    static let shared = EpisodeStorage()
    private var episodes: [Episode] = []
    
    //MARK: - Methods
    func savedEpisodes(episodes: [Episode]) {
        UserDefaults.standard.set(episodes, forKey: KeyUserDefaults.episodesDataKey)
    }
    func loadEpisodes() -> [Episode]? {
        if let saveEpisodeData = UserDefaults.standard.object(forKey: KeyUserDefaults.episodesDataKey) as? Data {
            return try? JSONDecoder().decode([Episode].self, from: saveEpisodeData)
        }
        return nil
    }
    func clearEpisodes() {
        UserDefaults.standard.removeObject(forKey: KeyUserDefaults.episodesDataKey)
        episodes = []
    }
}

