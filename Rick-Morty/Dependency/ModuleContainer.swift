//
//  ModuleContainer.swift
//  Rick-Morty
//
//  Created by July Belova on 16.06.2024.
//

import UIKit

protocol ModuleContainerProtocol {
    func getLaunchView() -> UIViewController
    func getTabBarView() -> UIViewController
    func getEpisodesView() -> UIViewController
    func getFavouritesView() -> UIViewController
    func getDetailsView() -> UIViewController
}

final class ModuleContainer: ModuleContainerProtocol {
   
    private let dependencies: DependenciesProtocol
    required init(_ dependencies: DependenciesProtocol) {
        self.dependencies = dependencies
    }
}
// MARK: - LaunchVC
extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchScreenController()
    }
}
// MARK: - TabBarVC
extension ModuleContainer {
    func getTabBarView() -> UIViewController {
        
        let view = TabBarController()
        let episodesVC = EpisodesAssembly.configure(dependencies)
        let favouritesVC = FavouritesAssembly.configure(dependencies)
        view.setViewControllers([episodesVC, favouritesVC], animated: false)
        return view
    }
}

// MARK: - EpisodesVC
extension ModuleContainer {
    func getEpisodesView() -> UIViewController {
        let view = EpisodesController()
        view.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        let viewModel = EpisodeViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}
// MARK: - FavouritesVC
extension ModuleContainer {
    func getFavouritesView() -> UIViewController {
        let view = FavouritesController()
        view.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        let viewModel = FavouritesViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}
// MARK: - DetailsVC
extension ModuleContainer {
    func getDetailsView() -> UIViewController {
        let view = CharacterDetailsController()
        let viewModel = DetailsViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}
