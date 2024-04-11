//
//  CharacterDetailsCoordinator.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class CharacterDetailsCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemGreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
    }
}

