//
//  FavouritesController.swift
//  Rick-Morty
//
//  Created by July Belova on 06.04.2024.
//

import UIKit

class FavouritesController: UIViewController {

    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()    }
    
    func setupUI() {
        view.backgroundColor = .white
        titleLabel.text = "Favourites episodes"
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 31),
            titleLabel.widthAnchor.constraint(equalToConstant: 228),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)])
    }
    
    
}

