//
//  RegistrationInteractor.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/14/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation
import FirebaseAuth

class RegistrationInteractor: RegistrationInteractorProtocol {
    
    weak var presenter: RegistrationPresenterProtocol?
    
    var userService: UserServiceProtocol
    
    init() {
        userService = UserService()
    }
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            
            guard let strongSelf = self else { return }
            
            if let user = user {
                strongSelf.userService.updateUser(.email, value: user.email ?? "")
                strongSelf.presenter?.registrationSucceed()
            } else if let error = error {
                strongSelf.presenter?.registrationFailedWithError(text: error.localizedDescription)
            }
        }
    }
    
}
