//
//  CollectionViewCell.swift
//  Rick-Morty
//
//  Created by July Belova on 11.04.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    private let imageCharacterImageView = UIImageView()
    private let nameCharacterLabel = UILabel()
    private let backgroundGreyImageView = UIImageView()
    private let monitorImageView = UIImageView()
    private let nameEpisodeLabel = UILabel()
    private let episodeLabel = UILabel()
    private let likeButton = UIButton()
    
    private var labelsStackView = UIStackView()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods - setupUI
    func setupUI() {
        contentView.backgroundColor = AppColors.accentWhite
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        contentView.clipsToBounds = true
        
        setupImageView()
        setupNameCharacterLabel()
        setupBackgroundGreyImageView()
        setupMonitorImageView()
        setupNameEpisodeLabel()
        setuplikeButton()
    }
}

extension CollectionViewCell {
    
    //MARK: - Image
    func setupImageView() {
        imageCharacterImageView.translatesAutoresizingMaskIntoConstraints = false
        imageCharacterImageView.backgroundColor = AppColors.accentLightBlue
        imageCharacterImageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageCharacterImageView)
        
        NSLayoutConstraint.activate([
            imageCharacterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCharacterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCharacterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    //MARK: - Name
    func setupNameCharacterLabel() {
        nameCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCharacterLabel.textAlignment = .left
        nameCharacterLabel.font = .Roboto.bold.size(of: 20)
        nameCharacterLabel.text = "Rick Sanchez"
        nameCharacterLabel.textColor = AppColors.accentDarkGrey
        contentView.addSubview(nameCharacterLabel)
        
        NSLayoutConstraint.activate([
            nameCharacterLabel.topAnchor.constraint(equalTo: imageCharacterImageView.bottomAnchor, constant: 16),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameCharacterLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    //MARK: - BackgroundGrey
    func setupBackgroundGreyImageView() {
        backgroundGreyImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundGreyImageView.layer.cornerRadius = 16
        backgroundGreyImageView.clipsToBounds = true
        backgroundGreyImageView.backgroundColor = AppColors.accentLightGrey.withAlphaComponent(0.3)
        contentView.addSubview(backgroundGreyImageView)
        
        NSLayoutConstraint.activate([
            backgroundGreyImageView.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 16),
            backgroundGreyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundGreyImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundGreyImageView.heightAnchor.constraint(equalToConstant: 71),
            backgroundGreyImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    //MARK: - Monitor
    func setupMonitorImageView() {
        monitorImageView.image = UIImage(systemName: "play.tv")
        monitorImageView.contentMode = .scaleAspectFit
        monitorImageView.tintColor = AppColors.accentDarkGrey
        monitorImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(monitorImageView)
        
        NSLayoutConstraint.activate([
            monitorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            monitorImageView.heightAnchor.constraint(equalToConstant: 34),
            monitorImageView.widthAnchor.constraint(equalToConstant: 33),
            monitorImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    //MARK: - NameEpisode
    func setupNameEpisodeLabel() {
        labelsStackView = UIStackView(arrangedSubviews: [nameEpisodeLabel, episodeLabel])
        labelsStackView.axis = .horizontal
        labelsStackView.spacing = 5
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelsStackView)
        
        nameEpisodeLabel.textAlignment = .left
        nameEpisodeLabel.font = .Roboto.regular.size(of: 16)
        nameEpisodeLabel.text = "name"
        nameEpisodeLabel.textColor = AppColors.accentGrey
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        episodeLabel.textAlignment = .left
        episodeLabel.font = .Roboto.regular.size(of: 16)
        episodeLabel.text = "| episode"
        episodeLabel.textColor = AppColors.accentGrey
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: monitorImageView.centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: monitorImageView.trailingAnchor, constant: 10),
        ])
    }
    //MARK: - Like
    func setuplikeButton() {
        likeButton.setImage(UIImage(named: "Heart"), for: .normal)
        likeButton.setImage(UIImage(named: "RedHeart"), for: .highlighted)
        likeButton.contentMode = .scaleAspectFit
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            likeButton.centerYAnchor.constraint(equalTo: monitorImageView.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
