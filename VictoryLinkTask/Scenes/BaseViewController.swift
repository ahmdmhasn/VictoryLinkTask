//
//  BaseViewController.swift
//  Mshwar
//
//  Created by Ahmed M. Hassan on 8/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
        return Constants.showLoader(view: view)
    }()
    
}

extension BaseViewController: BaseViewProtocol {
    
    func showAlert(message: String?, button text: String?, delegate: AlertViewDelegate?) {
        let alert = AlertView(frame: self.view.bounds)
        
        alert.setup(message: message, button: text, delegate: delegate)
                
        self.view.addSubview(alert)
        
        alert.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            alert.alpha = 1
        })
    }
    
    
    func showSVSuccess(message: String) {
        
    }
    
    @objc func showLoading() {
        activityIndicator.stopAnimating()
    }
    
    @objc func hideLoading() {
        activityIndicator.startAnimating()
    }
    
}
