//
//  VIPUsersVC.swift
//  VIPER_Starter
//
//  Created by Davit on 07.04.24.
//

import UIKit

protocol VIPUsersRouterProtocol{
    func routeToDetails()
}

class VIPUsersRouter: VIPUsersRouterProtocol {
    func routeToDetails() {
        
    }
}

class VIPUsersVC: UIViewController, VIPUsersViewProtocol {
    
    let interactor: VIPUsersInteractorProtocol
    let router: VIPUsersRouterProtocol
    
    init(interactor: VIPUsersInteractorProtocol, router: VIPUsersRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        router.routeToDetails()
        
        Task {
            await interactor.loadUsers()
        }
    }
 
    func usersDidLoad(_ users: [VIPUser]) {
        print("table view reload with \n", users)
    }
    
}


/// VIEW -> Interactor -> Presenter -> View -> INteractor ....
