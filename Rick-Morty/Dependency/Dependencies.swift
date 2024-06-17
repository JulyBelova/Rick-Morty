//
//  Dependencies.swift
//  Rick-Morty
//
//  Created by July Belova on 16.06.2024.
//

import Foundation

protocol DependenciesProtocol {
    var moduleContainer: ModuleContainerProtocol { get }
    //var userDefaultsRepository: UserDefaultsRepositoryProtocol { get }
    //var networkService: IHTTPClient { get }
}


final class Dependencies: DependenciesProtocol {
    lazy var moduleContainer: ModuleContainerProtocol = ModuleContainer(self)
    //lazy var userDefaultsRepository: UserDefaultsRepositoryProtocol = UserDefaultsRepository(container: UserDefaults.standard)
    //lazy var networkService: IHTTPClient = HTTPClient()
}

//// MARK: - Mock
//final class DependenciesMock: DependenciesProtocol {
//    lazy var moduleContainer: ModuleContainerProtocol = ModuleContainer(self)
//    //lazy var userDefaultsRepository: UserDefaultsRepositoryProtocol = UserDefaultsRepository(container: UserDefaults.standard)
//    //lazy var networkService: IHTTPClient = HTTPClient()
//}
