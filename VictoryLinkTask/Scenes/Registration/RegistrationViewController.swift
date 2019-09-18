//
//  RegistrationVC.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/14/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController {
    
    // Outlets
    @IBOutlet weak var emailTextField: RoundedTextField!
    
    @IBOutlet weak var passwordTextField: RoundedTextField!
    
    @IBOutlet weak var rePasswordTextField: RoundedTextField!
    
    // Properties
    var presenter: RegistrationPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindToKeyboard(withTapGesture: true)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        presenter.createUser(email: emailTextField.text, password1: passwordTextField.text, password2: rePasswordTextField.text)
    }
    
}

extension RegistrationViewController: RegistrationViewProtocol {
    

}
