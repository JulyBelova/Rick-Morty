//
//  EpisodesAssembly.swift
//  Rick-Morty
//
//  Created by July Belova on 16.06.2024.
//

import UIKit

final class EpisodesAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getEpisodesView()
    }
}
