//
//  AppCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    var dependencies: DependenciesProtocol
    
    
    init(navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchFlow()
    }

    func showLaunchFlow() {
        let launchCoordinator = LaunchScreenCoordinator(navigationController: navigationController, dependencies: dependencies)
        launchCoordinator.finishDelegate = self
        launchCoordinator.start()
        childCoordinators.append(launchCoordinator)
    }
    
    func showTabbar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController, dependencies: dependencies)
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
        print("showTabBarFlow")
    }
}
//MARK: - CoordinatorFinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .launch:
                showTabbar()
        case .app, .tabbar: break
        }
    }
}

