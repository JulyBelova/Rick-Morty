//
//  FavouritesCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class FavouritesCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemBlue
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
