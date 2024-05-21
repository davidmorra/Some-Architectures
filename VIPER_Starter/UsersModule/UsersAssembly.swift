//
//  UsersAssembly.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import UIKit

class UsersAssembly {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func createUsersViewController() -> UsersViewController {
        let vc = UsersViewController()
        let router = UsersRouter(navigationController: navigationController)
        let interactor = UsersInteractor()
        let presenter = UsersPresenter(router: router, interactor: interactor, view: vc)
        interactor.presenter = presenter
        vc.presenter = presenter

        return vc
    }
}
