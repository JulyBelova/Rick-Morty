//
//  AppCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit
class AppCoordinator: Coordinator {

    override func start() {
        showLaunchScreenFlow()
        //showTabBarFlow()
        //showCharacterDetails()
    }
    
    override func finish() {
    }
}
 //MARK: Navigation methods

extension AppCoordinator {
    func showLaunchScreenFlow() {
        guard let navigationController = navigationController else { return }
        let launchScreenCoordinator = LaunchScreenCoordinator(type: .launchScreen, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(launchScreenCoordinator)
        launchScreenCoordinator.start()
    }
    
    func showTabBarFlow() {
        guard let navigationController = navigationController else { return }
        let episodesNavigationController = UINavigationController()
        let episodesCoordinator = EpisodesCoordinator(type: .episodes, navigationController: episodesNavigationController)
        episodesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        episodesCoordinator.finishDelegate = self
        episodesCoordinator.start()
        
        let favouritesNavigationController = UINavigationController()
        let favouritesCoordinator = FavouritesCoordinator(type: .favourites, navigationController: favouritesNavigationController)
        favouritesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        favouritesCoordinator.finishDelegate = self
        favouritesCoordinator.start()
        
        addChildCoordinator(episodesCoordinator)
        addChildCoordinator(favouritesCoordinator)
        
        let tabBarControllers = [episodesNavigationController, favouritesNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showCharacterDetails() {
        guard let navigationController = navigationController else { return }
        let characterDetailsCoordinator = CharacterDetailsCoordinator(type: .characterDetails, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(characterDetailsCoordinator)
        characterDetailsCoordinator.start()
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .launchScreen:
            navigationController?.viewControllers.removeAll()
            showTabBarFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
