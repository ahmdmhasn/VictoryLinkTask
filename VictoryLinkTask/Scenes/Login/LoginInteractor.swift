//
//  UserInteractor.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/13/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginInteractor: LoginInteractorProtocol {
    
    weak var presenter: LoginPresenterProtocol?
    
    func loginUser(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presenter?.signInFailedWithError(message: error.localizedDescription)
                return
            }
            
            guard let user = user else {
                strongSelf.presenter?.signInFailedWithError(message: "Something went wrong!")
                return
            }
            
            Constants.userToken = user.user.uid
            
            strongSelf.presenter?.signInSucceed()
        }
        
    }
}
