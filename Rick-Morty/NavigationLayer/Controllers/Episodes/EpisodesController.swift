//
//  EpisodesController.swift
//  Rick-Morty
//
//  Created by July Belova on 06.04.2024.
//

import UIKit

class EpisodesController: UIViewController {
    //MARK: - Properties
    private let logoImageView = UIImageView()
    private var searchTextField = UISearchTextField()
    private let filtersButton = UIButton()
    private var collectionView: UICollectionView!
    
    var episodesViewOutput: EpisodesViewOutput!
    
    //MARK: - Init
    init(episodesViewOutput: EpisodesViewOutput!) {
        self.episodesViewOutput = episodesViewOutput
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    func setupUI() {
        view.backgroundColor = .white
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        
        searchTextField.placeholder = "Name or episode (ex.S01E01)..."
        searchTextField.font = .Roboto.light.size(of: 16)
        searchTextField.backgroundColor = AppColors.accentWhite
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 10
        searchTextField.layer.borderWidth = 2
        searchTextField.layer.borderColor = UIColor.systemGray5.cgColor
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        filtersButton.translatesAutoresizingMaskIntoConstraints = false
        filtersButton.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        filtersButton.setTitle("ADVANCED FILTERS", for: .normal)
        filtersButton.titleLabel?.font = .Roboto.light.size(of: 14)
        filtersButton.setTitleColor(AppColors.accentBlue, for: .normal)
        filtersButton.imageEdgeInsets.left = -150
        filtersButton.titleEdgeInsets.left = -20
        filtersButton.tintColor = .systemGray2
        filtersButton.backgroundColor = AppColors.accentLightBlue
        filtersButton.layer.cornerRadius = 10
        filtersButton.layer.borderWidth = 2
        filtersButton.layer.borderColor = UIColor.systemGray5.cgColor
        filtersButton.clipsToBounds = true
        view.addSubview(filtersButton)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 56),
            
            filtersButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filtersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            filtersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            filtersButton.heightAnchor.constraint(equalToConstant: 56),
            
            collectionView.topAnchor.constraint(equalTo: filtersButton.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension EpisodesController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        //cell.backgroundColor = .systemPink
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension EpisodesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    }
}
