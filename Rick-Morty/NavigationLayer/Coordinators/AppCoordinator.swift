//
//  AppCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit
class AppCoordinator: Coordinator {
    
    private let factory = SceneFactory.self
    
    override func start() {
        showLaunchScreenFlow()
    }
    
    override func finish() {
    }
}

//MARK: - Navigation methods
extension AppCoordinator {
    func showLaunchScreenFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeLaunchScreenFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    func showCharacterDetails() {
        guard let navigationController = navigationController else { return }
        factory.makeCharacterDetails(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
}

//MARK: - CoordinatorFinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .launchScreen:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
