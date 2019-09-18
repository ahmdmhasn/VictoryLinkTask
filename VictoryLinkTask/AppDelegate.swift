//
//  AppDelegate.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkClientToken()
        
        return true
    }



}

extension AppDelegate {
    
    func checkClientToken() {
        if Constants.userToken == nil {
            self.window?.rootViewController = LoginRouter.createView()
        } else {
//            let landingVC = BaseRouter.recyclablesNavigationController()
//            window?.rootViewController = UINavigationController(rootViewController: recyclablesVC)
        }
    }
    
}
