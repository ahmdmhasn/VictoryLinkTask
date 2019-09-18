//
//  LoginRouter.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/13/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class LoginRouter {
    
    fileprivate weak var navigationController: UINavigationController?
    
    fileprivate weak var viewController: UIViewController?
    
    private class var storyboard: UIStoryboard {
        return UIStoryboard(name: "LoginAndRegistration", bundle: nil)
    }
    
    class func createView() -> UIViewController {
        
        let view = storyboard.instantiateViewController(withIdentifier: "\(LoginViewController.self)") as! LoginViewController
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.isNavigationBarHidden = true
        
        router.navigationController = navigationController
        
        return navigationController
    }
}

extension LoginRouter: LoginRouterProtocol {
    
    func showRegisterVC() {
        
        let registrationVC = RegistrationRouter.createView()
                
        navigationController?.pushViewController(registrationVC, animated: true)
        
    }
    
    func showLandingViewController() {
        
        let vc = ContainerRouter.createView()
        
        viewController?.present(vc, animated: true, completion: nil)
        
    }
    
}

