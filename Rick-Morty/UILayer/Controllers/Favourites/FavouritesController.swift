//
//  FavouritesController.swift
//  Rick-Morty
//
//  Created by July Belova on 06.04.2024.
//

import UIKit

class FavouritesController: UIViewController {
    
    
    //MARK: - Properties
    private var collectionView: UICollectionView!
    
    //var episodeModel = EpisodeModel()
    var pressedCellItems = 0
    
    var favouritesViewOutput: FavouritesViewOutput!
    
    //MARK: - Init
    init(favouritesViewOutput: FavouritesViewOutput!) {
        self.favouritesViewOutput = favouritesViewOutput
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
    
    //MARK: - Methods - setupUI
    func setupUI() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Favourites episodes"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
// MARK: - UICollectionViewDataSource
extension FavouritesController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        //cell.backgroundColor = .systemPink
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension FavouritesController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
      
        navigationController?.pushViewController(CharacterDetailsController(), animated: true)
        //navigationController?.setNavigationBarHidden(false, animated: true)
        collectionView.reloadData()

    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension FavouritesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 1.15)
    }
}
