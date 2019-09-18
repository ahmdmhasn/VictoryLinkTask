//
//  LoginProtocols.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/13/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class, BaseViewProtocol {
    var presenter: LoginPresenterProtocol! { get set }
    func showLoading()
    func hideLoading()
}

protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol? { get set }
    func showRegisterViewController()
    func loginUser(email: String?, password: String?)
    func signInSucceed()
    func signInFailedWithError(message: String)
}

protocol LoginRouterProtocol {
    func showRegisterVC()
    func showLandingViewController()
}

protocol LoginInteractorProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    func loginUser(email: String, password: String)
}
