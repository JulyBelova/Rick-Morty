//
//  TabBarCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 16.06.2024.
//

import UIKit

final class TabBarCoordinator: Coordinator {

    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabbar }
    var dependencies: DependenciesProtocol
    
    required init(_ navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showTabBarController()
    }
    
    private func showTabBarController() {
        
        let tabBarVC = TabBarAssembly.configure(dependencies)
        let navVC = UINavigationController(rootViewController: tabBarVC)
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            window.rootViewController = navVC
            UIView.transition(with: window, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        } else {
            navVC.modalPresentationStyle = .fullScreen
            navigationController.showDetailViewController(navVC, sender: self)
        }
    }
}
