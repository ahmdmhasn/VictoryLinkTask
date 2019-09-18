//
//  RegistrationProtocols.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/14/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation

typealias userResponse = (String?, Error?)->()

protocol RegistrationViewProtocol: class, BaseViewProtocol {
    var presenter: RegistrationPresenterProtocol! { get set }
    func showLoading()
    func hideLoading()
}

protocol RegistrationPresenterProtocol: class {
    var view: RegistrationViewProtocol? { get set }
    func createUser(email: String?, password1: String?, password2: String?)
    func registrationFailedWithError(text: String)
    func registrationSucceed()
}

protocol RegistrationRouterProtocol {
    
}

protocol RegistrationInteractorProtocol: class {
    var presenter: RegistrationPresenterProtocol? { get set }
    func createUser(email: String, password: String)
}
