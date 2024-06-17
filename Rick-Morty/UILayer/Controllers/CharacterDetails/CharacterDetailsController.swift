//
//  CharacterDetailsController.swift
//  Rick-Morty
//
//  Created by July Belova on 06.04.2024.
//

import UIKit

class CharacterDetailsController: UIViewController {
    
    //MARK: - Properties
    private var logoImageView = UIImageView()
    private var imageCharacterImageView = UIImageView()
    private let cameraButton = UIButton()
    private let nameCharacterLabel = UILabel()
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    var viewModel: DetailsViewModelDelegate? 
//    var characterDetailsViewOutput: CharacterDetailsViewOutput!
    
//    //MARK: - Init
//    init(characterDetailsViewOutput: CharacterDetailsViewOutput!) {
//        self.characterDetailsViewOutput = characterDetailsViewOutput
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
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backButtonTitle = "GO BACK"
        
        setupLogoImageView()
        setupImageView()
        setupCameraButton()
        setupNameCharacterLabel()
        setupTitleLabel()
    
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: String(describing: DetailsTableViewCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
// MARK: - extension
extension CharacterDetailsController {
    //MARK: - Image
    func setupLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo-black")
        logoImageView.frame.size = CGSize(width: 46, height: 44)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -44),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    //MARK: - Image
    func setupImageView() {
        imageCharacterImageView.translatesAutoresizingMaskIntoConstraints = false
        imageCharacterImageView.image = UIImage(named: "1")
        //imageCharacterImageView.frame.size = CGSize(width: 148, height: 148)
        imageCharacterImageView.contentMode = .scaleAspectFill
        imageCharacterImageView.layer.cornerRadius = 74
        imageCharacterImageView.layer.borderWidth = 5
        imageCharacterImageView.layer.borderColor = UIColor.systemGray5.cgColor
        imageCharacterImageView.clipsToBounds = true
        view.addSubview(imageCharacterImageView)
        
        NSLayoutConstraint.activate([
            imageCharacterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageCharacterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageCharacterImageView.heightAnchor.constraint(equalToConstant: 148),
            imageCharacterImageView.widthAnchor.constraint(equalToConstant: 148)
        ])
    }
    
    //MARK: - Camera
    func setupCameraButton(){
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraButton.tintColor = .black
        cameraButton.clipsToBounds = true
        cameraButton.contentMode = .scaleAspectFill
        let cameraButtonTap = UITapGestureRecognizer(target: self, action: #selector(self.cameraButtonTap(_:)))
        self.cameraButton.isUserInteractionEnabled = true
        self.cameraButton.addGestureRecognizer(cameraButtonTap)
        view.addSubview(cameraButton)
        NSLayoutConstraint.activate([
            cameraButton.centerYAnchor.constraint(equalTo: imageCharacterImageView.centerYAnchor),
            cameraButton.leadingAnchor.constraint(equalTo: imageCharacterImageView.trailingAnchor, constant: 10),
            cameraButton.heightAnchor.constraint(equalToConstant: 32),
            cameraButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }
//    @objc func cameraButtonTap(_ sender: UITapGestureRecognizer) {
//        delegate?.cameraButtonTap()
//        print(#function)
//    }
    
    
    
    @objc func cameraButtonTap(_ sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Выберите действие", message: "Хотите сделать фото или выбрать из галереи?", preferredStyle: .actionSheet)

        let takePhotoAction = UIAlertAction(title: "Сделать фото", style: .default) { (_) in
            self.handleTakePhoto()
        }

        let chooseFromGalleryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { (_) in
            self.handleChooseFromGallery()
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromGalleryAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
        print(#function)
    }

    private func handleTakePhoto() {
        // Код для запуска камеры
    }

    private func handleChooseFromGallery() {
        // Код для доступа к галерее
    }
    //MARK: - Name
    func setupNameCharacterLabel() {
        nameCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCharacterLabel.textAlignment = .center
        nameCharacterLabel.font = .Roboto.bold.size(of: 32)
        nameCharacterLabel.text = "Rick Sanchez"
        nameCharacterLabel.textColor = AppColors.accentDarkGrey
        view.addSubview(nameCharacterLabel)
        
        NSLayoutConstraint.activate([
            nameCharacterLabel.topAnchor.constraint(equalTo: imageCharacterImageView.bottomAnchor, constant: 16),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    //MARK: - Name
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.font = .Roboto.bold.size(of: 20)
        titleLabel.text = "Informations"
        titleLabel.textColor = AppColors.accentLightGrey
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
//MARK: UITableViewDataSource
extension CharacterDetailsController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailsTableViewCell.self), for: indexPath) as! DetailsTableViewCell
            
            return cell
    }
}

