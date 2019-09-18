//
//  LoginViewController.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/14/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // Outlets
    @IBOutlet var usernameTextField: RoundedTextField!
    
    @IBOutlet weak var passwordTextField: RoundedTextField!
    
    // Properties
    var presenter: LoginPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindToKeyboard(withTapGesture: true)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        presenter.loginUser(email: usernameTextField.text, password: passwordTextField.text)
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        presenter.showRegisterViewController()
    }
    
    @IBAction func forgetPasswordPressed(_ sender: UIButton) {
        
    }
    
}

extension LoginViewController: LoginViewProtocol {
    
        
}

