//
//  LoginViewControllerTheme2.swift
//  LoginScreen
//
//  Created by raj on 09/11/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit

class LoginViewControllerTheme2: UIViewController {
    
    var logoImageView: UIImageView!
    var signupButton: UIButton!
    var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 222.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        
        logoImageView = UIImageView(image: UIImage(named: "LoginScreenLogo2"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        signupButton = UIButton(type: .System)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        signupButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signupButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        signupButton.setTitle("SIGN UP", forState: .Normal)
        signupButton.setTitle("SIGN UP", forState: .Highlighted)
        signupButton.titleLabel?.font = UIFont.boldSystemFontOfSize(40)
        
        signupButton.layer.backgroundColor = UIColor(red: 0.0/255.0, green: 179.0/255.0, blue: 255.0/255.0, alpha: 1.0).CGColor
        
        loginButton = UIButton(type: .System)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        loginButton.setTitle("LOG IN", forState: .Normal)
        loginButton.setTitle("LOG IN", forState: .Highlighted)
        loginButton.titleLabel?.font = UIFont.boldSystemFontOfSize(40)
        
        loginButton.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 25.0/255.0, blue: 64.0/255.0, alpha: 1.0).CGColor
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(signupButton)
        self.view.addSubview(loginButton)
        
        let viewsDictionary = [ "logoImageView" : logoImageView, "signupButton" : signupButton, "loginButton" : loginButton ]
        
        let logoImageViewConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:[logoImageView(100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let logoImageViewConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-180-[logoImageView(100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let logoImageViewHorizontalCenterConstraint = NSLayoutConstraint(item: logoImageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints(logoImageViewConstraintH)
        self.view.addConstraints(logoImageViewConstraintV)
        self.view.addConstraint(logoImageViewHorizontalCenterConstraint)
        
        let signupButtonConstraintH = NSLayoutConstraint(item: signupButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
        let signupButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[signupButton(80)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraint(signupButtonConstraintH)
        self.view.addConstraints(signupButtonConstraintV)
        
        let loginButtonConstraintH = NSLayoutConstraint(item: loginButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: 0.0)
        let loginButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[loginButton(80)]-0-[signupButton]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraint(loginButtonConstraintH)
        self.view.addConstraints(loginButtonConstraintV)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

}
