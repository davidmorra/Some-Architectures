//
//  UsersFlowCoordinator.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import UIKit

protocol UsersFlowCoordinatorDependencyFactory {
    func makeUsersViewController() -> CleanUsersVC
}

class UsersFlowCoordinator {
    private let navigationController: UINavigationController
    private let factory: UsersFlowCoordinatorDependencyFactory
    
    init(navigationController: UINavigationController, factory: UsersFlowCoordinatorDependencyFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func makeUsersViewController() -> CleanUsersVC {
        let vc = factory.makeUsersViewController()
        vc.onSelect = { user in
            self.showDetails(user)
        }
        return vc
    }
    
    func start() {
        navigationController.pushViewController(makeUsersViewController(), animated: true)
    }
    
    
    func showDetails(_ user: UsersItemViewModel) {
        navigationController.pushViewController(UIViewController(), animated: true)
    }
}
