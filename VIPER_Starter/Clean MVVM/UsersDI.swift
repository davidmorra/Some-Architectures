//
//  UsersDI.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import Foundation

class UsersDI {
    let apiClient: URLSession
    
    init(apiClient: URLSession) {
        self.apiClient = apiClient
    }
}

/// Users Screen
extension UsersDI: UsersFlowCoordinatorDependencyFactory {
    func makeUsersViewController() -> CleanUsersVC {
        let vc = CleanUsersVC(viewmodel: makeUsersViewModel())
        return vc
    }
    
    func makeUsersViewModel() -> CleanUsersViewModel {
        let vm = CleanUsersViewModel(useCase: makeUsersUseCase())
        return vm
    }
    
    func makeUsersUseCase() -> UsersUseCase {
        let useCase = UsersUseCaseImpl(respository: makeUsersRespository())
        return useCase
    }
    
    func makeUsersRespository() -> UsersRepositoryProtocol {
        let repository = UsersRepository(apiClient: apiClient)
        return repository
    }
}
