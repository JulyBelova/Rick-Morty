//
//  LaunchScreenViewPresenter.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import Foundation

protocol LaunchScreenViewOutput: AnyObject {
    func launchScreenViewFinish()
}

class LaunchScreenViewPresenter: LaunchScreenViewOutput {
    
    weak var coordinator: LaunchScreenCoordinator!
    
    init(coordinator: LaunchScreenCoordinator!) {
        self.coordinator = coordinator
    }
    
    func launchScreenViewFinish() {
        coordinator.finish()
    }
}
