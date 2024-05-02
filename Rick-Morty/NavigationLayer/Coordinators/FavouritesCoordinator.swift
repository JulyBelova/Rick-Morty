//
//  FavouritesCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

//MARK: - FavouritesCoordinator
class FavouritesCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
//        let vc = ViewController()
//        vc.view.backgroundColor = .systemBlue
//        navigationController?.pushViewController(vc, animated: true)
        
//        let presenter = FavouritesViewPresenter(coordinator: self)
//        let vc = FavouritesController(favouritesViewOutput: presenter)
//        navigationController?.pushViewController(vc, animated: true)
        let vc = factory.makeFavourites(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
