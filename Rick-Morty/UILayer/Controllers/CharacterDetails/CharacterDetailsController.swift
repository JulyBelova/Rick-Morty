//
//  CharacterDetailsController.swift
//  Rick-Morty
//
//  Created by July Belova on 06.04.2024.
//

import UIKit
protocol CameraDelegate: AnyObject {
    func cameraButtonTap()
}
class CharacterDetailsController: UIViewController {
    
    //MARK: - Properties
    private var imageCharacterImageView = UIImageView()
    private let cameraButton = UIButton()
    private let nameCharacterLabel = UILabel()
    private let titleLabel = UILabel()
    private let tableView = UITableView()

    weak var delegate: CameraDelegate?
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
        setupImageView()
        setupCameraButton()
        setupNameCharacterLabel()
        setupTitleLabel()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"logo-black"), style: .plain, target: self, action: nil)
        
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
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let arrowLeftButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(goBackToMain))
        let titleButtonItem = UIBarButtonItem(title: "GO BACK")
        return [arrowLeftButtonItem, titleButtonItem]
    }
    @objc func goBackToMain() {
        self.dismiss(animated: true, completion: nil)
    }
}
// MARK: - extension
extension CharacterDetailsController {
    
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
    @objc func cameraButtonTap(_ sender: UITapGestureRecognizer) {
        delegate?.cameraButtonTap()
        print(#function)
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

