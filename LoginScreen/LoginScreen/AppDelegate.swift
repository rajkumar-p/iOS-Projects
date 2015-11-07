//
//  AppDelegate.swift
//  LoginScreen
//
//  Created by raj on 04/11/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // Use the login controller as the root view controller
        let loginViewControllerTheme1 = LoginViewControllerTheme1()
        
        window?.rootViewController = loginViewControllerTheme1
        window?.makeKeyAndVisible()
        
        return true
    }

}

