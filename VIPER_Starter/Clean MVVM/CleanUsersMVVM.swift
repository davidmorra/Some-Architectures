//
//  CleanUsersMVVM.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import Foundation

struct UsersItemViewModel {
    let name: String
    
    init(_ domain: CleanUser) {
        self.name = domain.name
    }
}

// Presentation Layer -> Domain Layer <- Data Layer
class CleanUsersViewModel {
    
    let useCase: UsersUseCase
    private(set) var users: [UsersItemViewModel] = []
    
    init(useCase: UsersUseCase) {
        self.useCase = useCase
    }
    
    func load(_ completion: @escaping ((Result<[UsersItemViewModel], Error>) -> Void)) {
        useCase.loadUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users.map(UsersItemViewModel.init)
                completion(.success(users.map(UsersItemViewModel.init)))
                
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}

