//
//  EpisodesViewPresenter.swift
//  Rick-Morty
//
//  Created by July Belova on 11.04.2024.
//

import Foundation

protocol EpisodesViewOutput: AnyObject {
    func episodesViewFinish()
}

class EpisodesViewPresenter: EpisodesViewOutput {
    
    weak var coordinator: EpisodesCoordinator!
    
    init(coordinator: EpisodesCoordinator!) {
        self.coordinator = coordinator
    }
    
    func episodesViewFinish() {
        coordinator.finish()
    }
}
