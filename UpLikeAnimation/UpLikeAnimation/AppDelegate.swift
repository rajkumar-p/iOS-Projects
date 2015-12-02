//
//  AppDelegate.swift
//  UpLikeAnimation
//
//  Created by raj on 22/11/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let upAnimVC = UpAnimationViewController()
        
        window?.rootViewController = upAnimVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

