//
//  LaunchScreenCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

//MARK: - LaunchScreenCoordinator
class LaunchScreenCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
        let vc = factory.makeLaunchScreenScene(coordinator: self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
