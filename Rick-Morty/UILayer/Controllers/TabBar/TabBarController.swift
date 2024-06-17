//
//  TabBarController.swift
//  Rick-Morty
//
//  Created by July Belova on 05.04.2024.
//

import UIKit

class TabBarController: UITabBarController {
//    enum Event {
//        case page
//    }
    weak var coordinator: TabBarCoordinator!
//    var didSendEventHandler: ((TabBarController.Event) -> Void)?
    var controllers: [UIViewController] = []
////    var startIndex = 0
////    private lazy var currentIndex = startIndex {
////        didSet {
////            segmentControl.selectedSegmentIndex = currentIndex
////        }
////    }
//    private lazy var items = controllers.map { $0.title }
//    
////    override init(transitionStyle style: UIPageViewController.TransitionStyle,
////                  navigationOrientation: UIPageViewController.NavigationOrientation,
////                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
////        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
////    }
////    
////    @available(*, unavailable)
////    required init?(coder: NSCoder) {
////        fatalError()
////    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        delegate = self
//        setupUI()
//        configure(controllers: controllers)
//    }
//    
//    private func setupUI() {
//        view.backgroundColor = UIColor.white
////        segmentControl.selectedSegmentIndex = startIndex
////        navigationItem.titleView = segmentControl
//    }
//    
//    private func configure(controllers: [UIViewController]) {
//      
//        self.controllers = controllers
////        guard let controller = controllers[0] else { return }
////        setViewControllers([controller], animated: false)
//    }
//}
//
////extension TabBarController {
////    @objc
////    private func handleIndexChanged(sender: UIViewController) {
////        let selectedIndex = sender.presentedViewController
////        let direction: UIPageViewController.NavigationDirection =
////        selectedIndex < currentIndex ? .reverse : .forward
////        setViewControllers([controllers[selectedIndex]], direction: direction, animated: true)
////        currentIndex = selectedIndex
////    }
////}


 
//    //MARK: - Init
//    init(tabBarControllers: [UIViewController]) {
//        super.init(nibName: nil, bundle: nil)
//        for tab in tabBarControllers {
//            self.addChild(tab)
//        }
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
    //MARK: - Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        
    }
}
