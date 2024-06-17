//
//  LaunchScreenCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//
import Foundation
import UIKit

//MARK: - LaunchScreenCoordinator
final class LaunchScreenCoordinator: Coordinator {
    
    //MARK: - Properties
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: DependenciesProtocol
    
    init(navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    //MARK: - Methods
    func start() {
        showLaunchViewController()
    }
    
    func showLaunchViewController() {
        let launchScreenController = LaunchAssembly.configure(dependencies)
        if let launchScreenController = launchScreenController as? LaunchScreenController {
            launchScreenController.didSendEventHandler = { [weak self] event in
                switch event {
                case .launchComplete:
                    print("event: .launchComplete:")
                    self?.finish()
                    print(" self?.finish()")
                }
            }
        }
        navigationController.pushViewController(launchScreenController, animated: true)
        print("showLaunchViewController")
    }
}
