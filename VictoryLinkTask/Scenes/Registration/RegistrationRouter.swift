//
//  RegistrationRouter.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/14/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class RegistrationRouter {
    
    private weak var viewController: UIViewController?
    
    private class var storyboard: UIStoryboard {
        return UIStoryboard(name: "LoginAndRegistration", bundle: nil)
    }
    
    class func createView() -> UIViewController {
        
        let view = storyboard.instantiateViewController(withIdentifier: "\(RegistrationVC.self)") as! RegistrationVC
        let router = RegistrationRouter()
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension RegistrationRouter: RegistrationRouterProtocol {
    
}

