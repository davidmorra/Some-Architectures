//
//  SceneDelegate.swift
//  VIPER_Starter
//
//  Created by Davit on 04.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
//        makeWindow()
        makeCleanWindow()
    }
    
    func makeWindow() {
        let navigationController = UINavigationController()
        let usersAssembly = UsersAssembly(navigationController: navigationController)
        let vc = usersAssembly.createUsersViewController()
        
        navigationController.setViewControllers([vc], animated: true)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func makeCleanWindow() {
        let appDI = AppDIContainer()
        let navigationController = UINavigationController()
        let appFlow = AppFlowCoordinator(navigationController: navigationController, appDiContainer: appDI)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        appFlow.start()
    }
}

