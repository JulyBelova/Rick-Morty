//
//  DetailsTableViewCell.swift
//  Rick-Morty
//
//  Created by July Belova on 29.04.2024.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let detailsTextLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupTitleLabel()
        setupDetailsTextLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func configure(with info: EpisodeModel) {
//        titleLabel.text = info.result
//        detailsTextLabel.text = info.result
    }
    
    //MARK: - Title
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.font = .Roboto.bold.size(of: 16)
        titleLabel.textColor = AppColors.accentLightGrey
        titleLabel.text = "Title"
        contentView.addSubview(titleLabel)
    
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupDetailsTextLabel() {
        detailsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsTextLabel.textAlignment = .left
        detailsTextLabel.font = .Roboto.light.size(of: 14)
        detailsTextLabel.textColor = AppColors.accentLightGrey
        detailsTextLabel.text = "text"
        contentView.addSubview(detailsTextLabel)
        
        NSLayoutConstraint.activate([
            detailsTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            detailsTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsTextLabel.heightAnchor.constraint(equalToConstant: 20),
            detailsTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
