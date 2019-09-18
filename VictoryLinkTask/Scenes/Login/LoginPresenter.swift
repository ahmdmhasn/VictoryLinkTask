//
//  LoginPresenter.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/13/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    weak var view: LoginViewProtocol?
    
    var interactor: LoginInteractorProtocol
    
    var router: LoginRouterProtocol
    
    init(view: LoginViewProtocol, interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func showRegisterViewController() {
        router.showRegisterVC()
    }
    
    func loginUser(email: String?, password: String?) {
        
        guard let email = email, let password = password else { return }
        
        if email.isEmpty || password.isEmpty {
            view?.showAlert(message: "Email or password cannot be empty", button: nil, delegate: nil)
            return
        }
        
        view?.showLoading()
        
        interactor.loginUser(email: email, password: password)
    }
    
    func signInSucceed() {
        view?.hideLoading()
        
        router.showLandingViewController()
    }
    
    func signInFailedWithError(message: String) {
        view?.hideLoading()
        
        view?.showAlert(message: message, button: nil, delegate: nil)
    }
    
}
