//
//  TabBarController.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Init
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
    }
}
