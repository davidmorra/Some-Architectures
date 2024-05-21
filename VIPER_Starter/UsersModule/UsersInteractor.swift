//
//  UsersInteractor.swift
//  VIPER_Starter
//
//  Created by Davit on 04.04.24.
//

import Foundation

protocol UsersInteractorInput: AnyObject {
    var presenter: UsersInteractorOutput? { get set }
    func loadUsers()
}

protocol UsersInteractorOutput: AnyObject {
    func didReceive(error: String)
    func didLoad(users: [User])
}

class UsersInteractor: UsersInteractorInput {
    weak var presenter: UsersInteractorOutput?
    
    func loadUsers() {
        let users = [
            User(id: 0, name: "HULK", username: "voe"),
            User(id: 1, name: "HEHE", username: "voe"),
            User(id: 2, name: "IRON MAN", username: "voe")
        ]
        
        self.presenter?.didLoad(users: users)
    }
    
}
