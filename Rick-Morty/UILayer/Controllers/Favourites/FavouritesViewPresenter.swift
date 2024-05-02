//
//  FavouritesViewPresenter.swift
//  Rick-Morty
//
//  Created by July Belova on 25.04.2024.
//

import Foundation

protocol FavouritesViewOutput: AnyObject {
    func favouritesViewFinish()
}

class FavouritesViewPresenter: FavouritesViewOutput {
    
    weak var coordinator: FavouritesCoordinator!
    
    init(coordinator: FavouritesCoordinator!) {
        self.coordinator = coordinator
    }
    
    func favouritesViewFinish() {
        coordinator.finish()
    }
}

