//
//  DetailsAssembly.swift
//  Rick-Morty
//
//  Created by July Belova on 16.06.2024.
//

import UIKit

final class DetailsAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getLaunchView()
    }
}

