//
//  CollectionViewCell.swift
//  Rick-Morty
//
//  Created by July Belova on 11.04.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
   
   
    //MARK: - Properties
    private let logoImageView = UIImageView()
    
   
    private let logoNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    func setupUI() {
        contentView.backgroundColor = .systemPink
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.clipsToBounds = true
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(systemName: "person.fill.questionmark")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.backgroundColor = .lightGray
        contentView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 232),
            //logoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
        ])
    }
}
