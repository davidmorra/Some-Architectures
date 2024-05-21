//
//  Data.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import Foundation

enum NetworkError: Error {
    case dataError
}

struct CleanUsersDTO: Decodable {
    let id: Int
    let name: String
    let username: String
    
    func toDomain() -> CleanUser {
        return .init(id: id, name: name, username: username)
    }
}

/// Data Layer -> Domain Layer
class UsersRepository: UsersRepositoryProtocol {
    private let apiClient: URLSession
    
    init(apiClient: URLSession = .shared) {
        self.apiClient = apiClient
    }
    
    func loadUsers(completion: @escaping ((Result<[CleanUser], Error>) -> Void)) {
        let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        apiClient.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(error)) }
            } else {
                
                guard let data = data else {
                    completion(.failure(NetworkError.dataError))
                    return
                }
                
                do {
                    let users = try JSONDecoder().decode([CleanUsersDTO].self, from: data)
                    DispatchQueue.main.async { completion(.success(users.map { $0.toDomain() })) }
                } catch {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            }
        }.resume()
    }
}
