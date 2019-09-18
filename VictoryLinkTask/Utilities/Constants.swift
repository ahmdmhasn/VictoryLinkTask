//
//  Constants.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static var userToken: String? {
        get {
            return UserDefaults.standard.string(forKey: AppDefaultKeys.kUserToken)
        }
        set(newVal) {
            UserDefaults.standard.set(newVal, forKey: AppDefaultKeys.kUserToken)
        }
    }
    
    struct AppDefaultKeys {
        static let kUserToken = "userToken"
    }
    
    static func showLoader(view: UIView) -> UIActivityIndicatorView {
        
        //Customize as per your need
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height:60))
        spinner.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        spinner.layer.cornerRadius = 8.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = UIActivityIndicatorView.Style.white
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        return spinner
    }
    
}

extension UIActivityIndicatorView {
    
    func dismissLoader() {
        self.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
}
