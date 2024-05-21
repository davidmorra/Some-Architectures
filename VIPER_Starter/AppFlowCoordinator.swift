//
//  AppFlowCoordinator.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import UIKit

class AppDIContainer {
    private let apiClient: URLSession = .shared
    
    func makeUsersDiContainer() -> UsersDI {
        UsersDI(apiClient: apiClient)
    }
}

class AppFlowCoordinator {
    let navigationController: UINavigationController
    let appDiContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDiContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDiContainer = appDiContainer
    }
    
    func start() {
        let usersDi = appDiContainer.makeUsersDiContainer()
        let usersFlow = UsersFlowCoordinator(navigationController: navigationController, factory: usersDi)
        usersFlow.start()
    }
}
