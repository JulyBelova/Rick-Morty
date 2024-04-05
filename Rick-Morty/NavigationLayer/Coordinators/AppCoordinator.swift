//
//  AppCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit
class AppCoordinator: Coordinator, CoordinatorFinishDelegate {
    
    override func start() {
        showLaunchScreen()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

 //MARK: Navigation methods
private extension AppCoordinator {
    func showLaunchScreen() {
        guard let navigationController = navigationController else { return }
        let launchScreenCoordinator = LaunchScreenCoordinator(type: .launchScreen, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(launchScreenCoordinator)
        launchScreenCoordinator.start()
    }
    func showMain() {
        
    }
}

extension AppCoordinator {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .launchScreen: 
            return
        default: 
            navigationController?.popViewController(animated: false)
        }
    }
}
