//
//  LaunchScreenCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class LaunchScreenCoordinator: Coordinator {

    override func start() {
        let presenter = LaunchScreenViewPresenter(coordinator: self)
        let vc = LaunchScreenController(launchScreenViewOutput: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
