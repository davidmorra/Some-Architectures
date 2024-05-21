//
//  VIPUsersPresenter.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import Foundation

struct VIPUser: Decodable {
    let name: String
}

protocol VIPUsersViewProtocol: AnyObject {
    func usersDidLoad(_ users: [VIPUser])
}

protocol VIPUsersPresenterProtocol {
    func usersDidLoad(_ users: [VIPUser])
}

class VIPUsersPresenter: VIPUsersPresenterProtocol {
    weak var view: VIPUsersViewProtocol?
     
    init(view: VIPUsersViewProtocol) {
        self.view = view
    }
    
    func usersDidLoad(_ users: [VIPUser]) {
        view?.usersDidLoad(users)
    }
}
