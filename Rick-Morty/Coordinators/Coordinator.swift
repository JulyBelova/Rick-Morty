//
//  Coordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

enum CoordinatorType {
    case app, launch, tabbar
}

protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    var dependencies: DependenciesProtocol { get }
    
    func start()
    func finish()
}

extension Coordinator {

    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}



