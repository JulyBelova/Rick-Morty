//
//  LaunchScreenCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class LaunchScreenCoordinator: Coordinator {
    
    override func start() {
        let vc = LaunchScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
