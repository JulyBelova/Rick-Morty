//
//  EpisodesCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class EpisodesCoordinator: Coordinator {
    
    override func start() {
        let presenter = EpisodesViewPresenter(coordinator: self)
        let vc = EpisodesController(episodesViewOutput: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
    }
}
