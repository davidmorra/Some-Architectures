//
//  UsersPresenter.swift
//  VIPER_Starter
//
//  Created by Davit on 04.04.24.
//

import Foundation

protocol UsersPresenterInput {
    var router: UsersRouterInput { get set }
    var interactor: UsersInteractorInput { get set }
    var view: UsersViewControllerInput { get set }
}

protocol UsersPresenterOutput: AnyObject { }

/// Presenter
/// Holds View
/// Holds Interactor
/// Tell's router what to show
class UsersPresenter {
    var router: UsersRouterInput
    var interactor: UsersInteractorInput
    weak var view: UsersViewControllerInput?
    
    init(router: UsersRouterInput, interactor: UsersInteractorInput, view: UsersViewControllerInput) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}

extension UsersPresenter: UsersViewControllerOutput {
    func didSelectUser(_ user: User) {
        router.showDetails(for: user)
    }
    
    func viewDidLoad() {
        interactor.loadUsers()
    }
}

extension UsersPresenter: UsersInteractorOutput {
    func didReceive(error: String) {
        
    }
    
    func didLoad(users: [User]) {
        view?.showUsers(users)
    }
}

