//
//  RegistrationPresenter.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/14/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation

class RegistrationPresenter: RegistrationPresenterProtocol {
    
    weak var view: RegistrationViewProtocol?
    
    private var interactor: RegistrationInteractorProtocol
    
    private var router: RegistrationRouterProtocol
    
    init(view: RegistrationViewProtocol, interactor: RegistrationInteractorProtocol, router: RegistrationRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func createUser(email: String?, password1: String?, password2: String?) {
        
        guard let email = email else { return }
        
        guard let password = password1, let rePassword = password2 else { return }
        
        if email.isEmpty || password.isEmpty {
            view?.showAlert(message: "Email or password cannpt be empty!", button: nil, delegate: nil)
            return
        }
        
        if password != rePassword {
            view?.showAlert(message: "Passwords doesn't match!", button: nil, delegate: nil)
            return
        }
        
        view?.showLoading()
        
        interactor.createUser(email: email, password: password)
    }
    
    func registrationFailedWithError(text: String) {
        
        view?.hideLoading()
        
        view?.showAlert(message: text, button: nil, delegate: nil)
    }
    
    func registrationSucceed() {
        
        view?.hideLoading()
        
        // TODO: navigate to main view
    }
    
    
}
