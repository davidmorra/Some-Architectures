//
//  VIPUsersInteractor.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import Foundation

protocol VIPUsersInteractorProtocol {
    func loadUsers() async
}

protocol VIPUsersWorker {
    func loadUsers() async -> [VIPUser]
}

class VIPUsersWorkerImpl: VIPUsersWorker {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func loadUsers() async -> [VIPUser] {
        do {
            let (data, _) = try await session.data(from: URL(string: "https://jsonplaceholder.typicode.com/users")!)
            let users = try JSONDecoder().decode([VIPUser].self, from: data)
            return users
        } catch {
            return []
        }
    }
}

class VIPUsersInteractor: VIPUsersInteractorProtocol {
    let presenter: VIPUsersPresenterProtocol
    let worker: VIPUsersWorker
    
    init(presenter: VIPUsersPresenterProtocol, worker: VIPUsersWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func loadUsers() async {
        let users = await worker.loadUsers()
        presenter.usersDidLoad(users)
    }
}
