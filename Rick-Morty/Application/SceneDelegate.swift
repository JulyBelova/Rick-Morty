//
//  SceneDelegate.swift
//  Rick-Morty
//
//  Created by July Belova on 04.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: Coordinator?
    private var dependencies: DependenciesProtocol = Dependencies()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        coordinator = AppCoordinator(navigationController: navigationController, dependencies: dependencies)
        coordinator?.start()
    }
}
