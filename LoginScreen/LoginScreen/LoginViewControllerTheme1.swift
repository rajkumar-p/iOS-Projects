//
//  LoginViewController.swift
//  LoginScreen
//
//  Created by raj on 04/11/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewControllerTheme1: UIViewController, UITextFieldDelegate {
    
    var usernameTextField: HoshiTextField!
    var passwordTextField: HoshiTextField!
    
    var logoImageView: UIImageView!
    var loginButton: UIButton!
    
    var forgotPasswordButton: UIButton!
    var signupButton: UIButton!
    var termsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(image: UIImage(named: "LoginScreen"))
        self.view.addSubview(backgroundImage)
        
        logoImageView = UIImageView(image: UIImage(named: "LoginScreenLogo"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        usernameTextField = HoshiTextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
       
        usernameTextField.borderActiveColor = UIColor.whiteColor()
        usernameTextField.borderInactiveColor = UIColor.whiteColor()
        usernameTextField.placeholderColor = UIColor.whiteColor()
        usernameTextField.font = UIFont.systemFontOfSize(23)
        
        usernameTextField.textColor = UIColor.whiteColor()
        usernameTextField.placeholder = "Email"
        usernameTextField.keyboardType = UIKeyboardType.EmailAddress
        usernameTextField.delegate = self
        
        passwordTextField = HoshiTextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.borderActiveColor = UIColor.whiteColor()
        passwordTextField.borderInactiveColor = UIColor.whiteColor()
        passwordTextField.placeholderColor = UIColor.whiteColor()
        passwordTextField.font = UIFont.systemFontOfSize(23)
        
        passwordTextField.textColor = UIColor.whiteColor()
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
        passwordTextField.delegate = self
        
        loginButton = UIButton(type: UIButtonType.System)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.setTitle("Login", forState: .Highlighted)
        
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        loginButton.layer.cornerRadius = 2
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        forgotPasswordButton = UIButton(type: .System)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton.setTitle("Forgot Password?", forState: .Normal)
        forgotPasswordButton.setTitle("Forgot Password?", forState: .Highlighted)
        
        forgotPasswordButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        forgotPasswordButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        signupButton = UIButton(type: .System)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        signupButton.setTitle("Sign Up", forState: .Normal)
        signupButton.setTitle("Sign Up", forState: .Highlighted)
        
        signupButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signupButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        termsButton = UIButton(type: .System)
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        
        termsButton.setTitle("Terms", forState: .Normal)
        termsButton.setTitle("Terms", forState: .Highlighted)
        
        termsButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        termsButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(forgotPasswordButton)
        self.view.addSubview(signupButton)
        self.view.addSubview(termsButton)
        
        let viewsDictionary = [ "logoImageView" : logoImageView, "usernameTextField" : usernameTextField, "passwordTextField" : passwordTextField, "loginButton" : loginButton, "forgotPasswordButton" : forgotPasswordButton, "signupButton" : signupButton, "termsButton" : termsButton ]
        
        let logoImageViewConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:[logoImageView(75)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let logoImageViewConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[logoImageView(75)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let logoImageViewHorizontalCenterConstraint = NSLayoutConstraint(item: logoImageView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints(logoImageViewConstraintH)
        self.view.addConstraints(logoImageViewConstraintV)
        self.view.addConstraint(logoImageViewHorizontalCenterConstraint)
        
        let usernameTextFieldConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[usernameTextField(>=100)]-30-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let usernameTextFieldConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[logoImageView]-90-[usernameTextField(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(usernameTextFieldConstraintH)
        self.view.addConstraints(usernameTextFieldConstraintV)
        
        let passwordTextFieldConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[passwordTextField(>=100)]-30-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let passwordTextFieldConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[usernameTextField]-30-[passwordTextField(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(passwordTextFieldConstraintH)
        self.view.addConstraints(passwordTextFieldConstraintV)
        
        let loginButtonConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[loginButton]-30-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let loginButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[passwordTextField]-60-[loginButton(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(loginButtonConstraintH)
        self.view.addConstraints(loginButtonConstraintV)
        
        let forgotPasswordButtonConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[forgotPasswordButton]-30-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let forgotPasswordButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[loginButton]-30-[forgotPasswordButton(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(forgotPasswordButtonConstraintH)
        self.view.addConstraints(forgotPasswordButtonConstraintV)
        
        let signupButtonConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-9-[signupButton]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let signupButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[signupButton]-9-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(signupButtonConstraintH)
        self.view.addConstraints(signupButtonConstraintV)
        
        let termsButtonConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:[termsButton]-9-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let termsButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[termsButton]-9-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(termsButtonConstraintH)
        self.view.addConstraints(termsButtonConstraintV)
        
        self.view.endEditing(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}