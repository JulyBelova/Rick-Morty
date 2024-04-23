//
//  FavouritesCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

//MARK: - FavouritesCoordinator
class FavouritesCoordinator: Coordinator {
    
    //MARK: - Methods
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemBlue
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
