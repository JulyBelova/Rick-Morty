//
//  LaunchScreenController.swift
//  Rick-Morty
//
//  Created by July Belova on 04.04.2024.
//

import UIKit

final class LaunchScreenController: UIViewController {
    enum Event {
        case launchComplete
    }
    
    //MARK: - Properties
    var didSendEventHandler: ((LaunchScreenController.Event) -> Void)?
    //weak var launchScreenCoordinator: LaunchScreenCoordinator!
    private let logoImageView = UIImageView()
    private let loadingComponentImageView = UIImageView()
   
    //MARK: - Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startAnimationAndGoToMainVC()
    }
    
    //MARK: - Methods - setupUI
    func setupUI() {
        view.backgroundColor = .white
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        
        loadingComponentImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingComponentImageView.image = UIImage(named: "LoadingComponent")
        loadingComponentImageView.contentMode = .scaleAspectFit
        view.addSubview(loadingComponentImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            logoImageView.widthAnchor.constraint(equalToConstant: 312),
            logoImageView.heightAnchor.constraint(equalToConstant: 104),
            
            loadingComponentImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingComponentImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingComponentImageView.widthAnchor.constraint(equalToConstant: 200),
            loadingComponentImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    //MARK: - Animation
    func startAnimationAndGoToMainVC() {
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveLinear, animations: {
            self.loadingComponentImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }, completion: { isFinished in
            UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveLinear, animations: {
                self.loadingComponentImageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
            }, completion: { isFinished in
                self.didSendEventHandler?(.launchComplete)
 //               self.launchScreenViewOutput.launchScreenViewFinish()
            })
        })
    }
}
