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
    
    //weak var coordinator: EpisodesCoordinator!
    var viewModel: EpisodeViewModelDelegate? 
    
//    var episodesViewOutput: EpisodesViewOutput!
//    
//    //MARK: - Init
//    init(episodesViewOutput: EpisodesViewOutput!) {
//        self.episodesViewOutput = episodesViewOutput
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    //MARK: - Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods - setupUI
    func setupUI() {
        view.backgroundColor = .white
        setupLogoImageView()
        setupSearchTextField()
        setupFiltersButton()
        navigationController?.setNavigationBarHidden(false, animated: true)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: filtersButton.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
// MARK: - extension
extension EpisodesController {
    
    func setupLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupSearchTextField() {
        searchTextField.placeholder = "Name or episode (ex.S01E01)..."
        searchTextField.font = .Roboto.light.size(of: 16)
        searchTextField.backgroundColor = AppColors.accentWhite
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 10
        searchTextField.layer.borderWidth = 2
        searchTextField.layer.borderColor = UIColor.systemGray5.cgColor
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func setupFiltersButton(){
        filtersButton.translatesAutoresizingMaskIntoConstraints = false
        filtersButton.setImage(UIImage(systemName: "line.3.horizontal.decrease"), for: .normal)
        filtersButton.tintColor = AppColors.accentGrey
        filtersButton.setTitle("ADVANCED FILTERS", for: .normal)
        filtersButton.titleLabel?.font = .Roboto.regular.size(of: 14)
        filtersButton.setTitleColor(AppColors.accentBlue, for: .normal)
        filtersButton.imageEdgeInsets.left = -180
        filtersButton.titleEdgeInsets.left = -20
        filtersButton.backgroundColor = AppColors.accentLightBlue
        filtersButton.layer.cornerRadius = 10
        filtersButton.layer.borderWidth = 2
        filtersButton.layer.borderColor = UIColor.systemGray5.cgColor
        filtersButton.clipsToBounds = true
        view.addSubview(filtersButton)
        NSLayoutConstraint.activate([
            filtersButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filtersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            filtersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            filtersButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

// MARK: - UICollectionViewDataSource
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

// MARK: - UICollectionViewDelegate
extension EpisodesController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
      
        navigationController?.pushViewController(CharacterDetailsController(), animated: true)

        collectionView.reloadData()

    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension EpisodesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 1.15)
    }
}
