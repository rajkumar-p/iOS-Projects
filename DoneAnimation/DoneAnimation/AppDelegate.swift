//
//  AppDelegate.swift
//  DoneAnimation
//
//  Created by raj on 05/12/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let doneAnimVC = DoneAnimViewController()
        
        window?.rootViewController = doneAnimVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

