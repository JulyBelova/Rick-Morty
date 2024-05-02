//
//  EpisodesCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

//MARK: - EpisodesCoordinator
class EpisodesCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
//        let presenter = EpisodesViewPresenter(coordinator: self)
//        let vc = EpisodesController(episodesViewOutput: presenter)
//        navigationController?.pushViewController(vc, animated: true)
        let vc = factory.makeEpisodes(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func finish() {
    }
}
