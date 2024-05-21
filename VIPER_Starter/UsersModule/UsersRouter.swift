//
//  UsersRouter.swift
//  VIPER_Starter
//
//  Created by Davit on 04.04.24.
//

import UIKit

protocol UsersRouterInput {
    func showDetails(for user: User)
}

class UsersRouter: UsersRouterInput {
    let navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showDetails(for user: User) {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemRed
        vc.title = user.name
        navigationController.pushViewController(vc, animated: true)
    }
}
