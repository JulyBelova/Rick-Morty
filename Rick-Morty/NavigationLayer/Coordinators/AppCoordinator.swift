//
//  AppCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit
class AppCoordinator: Coordinator, CoordinatorFinishDelegate {
    
    override func start() {
        //showLaunchScreen()
        showTabBar()
        //showCharacterDetails()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

 //MARK: Navigation methods

extension AppCoordinator {
    func showLaunchScreen() {
        guard let navigationController = navigationController else { return }
        let launchScreenCoordinator = LaunchScreenCoordinator(type: .launchScreen, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(launchScreenCoordinator)
        launchScreenCoordinator.start()
    }
    
    func showTabBar() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .episodes, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let heartNavigationController = UINavigationController()
        let heartCoordinator = HeartCoordinator(type: .favourites, navigationController: heartNavigationController)
        heartNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        heartCoordinator.finishDelegate = self
        heartCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(heartCoordinator)
        
        let tabBarControllers = [homeNavigationController, heartNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showCharacterDetails() {
        guard let navigationController = navigationController else { return }
        let characterDetailsCoordinator = CharacterDetailsCoordinator(type: .favourites, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(characterDetailsCoordinator)
        characterDetailsCoordinator.start()
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
