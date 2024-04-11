//
//  EpisodesCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class EpisodesCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemYellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
    }
}
