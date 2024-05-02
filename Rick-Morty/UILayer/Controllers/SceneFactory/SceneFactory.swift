//
//  SceneFactory.swift
//  Rick-Morty
//
//  Created by July Belova on 15.04.2024.
//

import UIKit

struct SceneFactory {
    
    //MARK: - LaunchScreen Flow
    static func makeLaunchScreenFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let launchScreenCoordinator = LaunchScreenCoordinator(type: .launchScreen, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(launchScreenCoordinator)
        launchScreenCoordinator.start()
        print(#function)
    }
    static func makeLaunchScreenScene(coordinator: LaunchScreenCoordinator) -> LaunchScreenController {
        let presenter = LaunchScreenViewPresenter(coordinator: coordinator)
        let vc = LaunchScreenController(launchScreenViewOutput: presenter)
        print(#function)
        return vc
    }
    
    //MARK: - Main Flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let episodesNavigationController = UINavigationController()
        let episodesCoordinator = EpisodesCoordinator(type: .episodes, navigationController: episodesNavigationController)
        episodesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        episodesCoordinator.finishDelegate = finishDelegate
        episodesCoordinator.start()
        
        let favouritesNavigationController = UINavigationController()
        let favouritesCoordinator = FavouritesCoordinator(type: .favourites, navigationController: favouritesNavigationController)
        favouritesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        favouritesCoordinator.finishDelegate = finishDelegate
        favouritesCoordinator.start()
        
        coordinator.addChildCoordinator(episodesCoordinator)
        coordinator.addChildCoordinator(favouritesCoordinator)
        
        let tabBarControllers = [episodesNavigationController, favouritesNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        print(#function)
        return tabBarController
    }
    static func makeEpisodes(coordinator: EpisodesCoordinator) -> EpisodesController {
        let presenter = EpisodesViewPresenter(coordinator: coordinator)
        let vc = EpisodesController(episodesViewOutput: presenter)
        print(#function)
        return vc
    }
    static func makeFavourites(coordinator: FavouritesCoordinator) -> FavouritesController {
        let presenter = FavouritesViewPresenter(coordinator: coordinator)
        let vc = FavouritesController(favouritesViewOutput: presenter)
        print(#function)
        return vc
    }
}
