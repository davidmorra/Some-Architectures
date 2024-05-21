//
//  CleanUsersUseCase.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import Foundation

protocol UsersRepositoryProtocol {
    func loadUsers(completion: @escaping ((Result<[CleanUser], Error>) -> Void))
}

/// Domain
protocol UsersUseCase {
    func loadUsers(completion: @escaping ((Result<[CleanUser], Error>) -> Void))
}

class UsersUseCaseImpl: UsersUseCase {
    let respository: UsersRepositoryProtocol
    
    init(respository: UsersRepositoryProtocol) {
        self.respository = respository
    }
    
    func loadUsers(completion: @escaping ((Result<[CleanUser], Error>) -> Void)) {
        respository.loadUsers(completion: completion)
    }
}

struct CleanUser {
    let id: Int
    let name: String
    let username: String
}

