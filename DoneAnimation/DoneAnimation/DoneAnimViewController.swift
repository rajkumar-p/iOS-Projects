//
//  DoneAnimViewController.swift
//  DoneAnimation
//
//  Created by raj on 05/12/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit
import JNWSpringAnimation

class DoneAnimViewController: UIViewController {

    var circleView: UIView!
    var checkButton: UIButton!
    var checkImage: UIImage!
    var checkImageTinted: UIImage!
    
    var userImageView: UIImageView!
    var settingsImageView: UIImageView!
    
    let greenColor = UIColor(red: 13.0 / 255.0, green: 232.0 / 255.0, blue: 0 / 255.0, alpha: 1.0)
    
    var firstMainText: UILabel!
    var firstSubtitleText: UILabel!
    
    var secondMainText: UILabel!
    var secondSubtitleText: UILabel!
    
    var bottomMainText: UILabel!
    var bottomSubtitleNum1: UILabel!
    var bottomSubtitleNum2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        checkImage = UIImage(named: "CheckImage")
        checkImageTinted = UIImage(named: "CheckImage")!.imageWithRenderingMode(.AlwaysTemplate)
        
        userImageView = UIImageView(image: UIImage(named: "UserImage")!.imageWithRenderingMode(.AlwaysTemplate))
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.tintColor = UIColor.blackColor()
        
        settingsImageView = UIImageView(image: UIImage(named: "SettingsImage")!.imageWithRenderingMode(.AlwaysTemplate))
        
        settingsImageView.translatesAutoresizingMaskIntoConstraints = false
        settingsImageView.tintColor = UIColor.blackColor()

        circleView = UIView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        circleView.layer.backgroundColor = greenColor.CGColor
        circleView.layer.borderColor = greenColor.CGColor
        
        checkButton = UIButton(type: .System)
        checkButton.setImage(checkImageTinted, forState: .Normal)
        checkButton.tintColor = UIColor.whiteColor()
        
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.layer.backgroundColor = greenColor.CGColor
        checkButton.layer.borderColor = greenColor.CGColor
        
        checkButton.addTarget(self, action: "checkButtonTouchEvent:", forControlEvents: .TouchUpInside)
        
        firstMainText = UILabel()
        firstMainText.translatesAutoresizingMaskIntoConstraints = false
        
        firstMainText.text = "Be Amazing"
        firstMainText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle3)
        firstMainText.textAlignment = .Center
        
        firstSubtitleText = UILabel()
        firstSubtitleText.translatesAutoresizingMaskIntoConstraints = false
        
        firstSubtitleText.text = "TODAY"
        firstSubtitleText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        firstSubtitleText.textColor = UIColor.grayColor()
        firstSubtitleText.textAlignment = .Center
        
        secondMainText = UILabel()
        secondMainText.translatesAutoresizingMaskIntoConstraints = false
        
        secondMainText.text = "Nice!"
        secondMainText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle3)
        secondMainText.textColor = UIColor.whiteColor()
        secondMainText.textAlignment = .Center
        
        secondSubtitleText = UILabel()
        secondSubtitleText.translatesAutoresizingMaskIntoConstraints = false
        
        secondSubtitleText.text = "YOU'RE AMAZING"
        secondSubtitleText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        secondSubtitleText.textColor = UIColor.whiteColor()
        secondSubtitleText.textAlignment = .Center
        
        secondMainText.alpha = 0.0
        secondSubtitleText.alpha = 0.0
        
        bottomMainText = UILabel()
        bottomMainText.translatesAutoresizingMaskIntoConstraints = false
        
        bottomMainText.text = "STREAK"
        bottomMainText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle3)
        bottomMainText.textColor = UIColor.blackColor()
        bottomMainText.textAlignment = .Center
        
        bottomSubtitleNum1 = UILabel()
        bottomSubtitleNum1.translatesAutoresizingMaskIntoConstraints = false
        
        bottomSubtitleNum1.text = "17"
        bottomSubtitleNum1.font = UIFont.systemFontOfSize(45.0)
        bottomSubtitleNum1.textColor = greenColor
        bottomSubtitleNum1.textAlignment = .Center
        
        bottomSubtitleNum2 = UILabel()
        bottomSubtitleNum2.translatesAutoresizingMaskIntoConstraints = false
        
        bottomSubtitleNum2.text = "18"
        bottomSubtitleNum2.font = UIFont.systemFontOfSize(45.0)
        bottomSubtitleNum2.textColor = UIColor.whiteColor()
        bottomSubtitleNum2.textAlignment = .Center
        
        bottomSubtitleNum2.alpha = 0.0
        
        self.view.addSubview(circleView)
        self.view.addSubview(checkButton)
        self.view.addSubview(userImageView)
        self.view.addSubview(settingsImageView)
        self.view.addSubview(firstMainText)
        self.view.addSubview(firstSubtitleText)
        self.view.addSubview(secondMainText)
        self.view.addSubview(secondSubtitleText)
        self.view.addSubview(bottomMainText)
        self.view.addSubview(bottomSubtitleNum1)
        self.view.addSubview(bottomSubtitleNum2)
        
        let viewsDict = [ "checkButton" : checkButton, "circleView" : circleView, "userImageView" : userImageView, "settingsImageView" : settingsImageView, "firstMainText" : firstMainText, "firstSubtitleText" : firstSubtitleText, "secondMainText" : secondMainText, "secondSubtitleText" : secondSubtitleText, "bottomMainText" : bottomMainText, "bottomSubtitleNum1" : bottomSubtitleNum1, "bottomSubtitleNum2" : bottomSubtitleNum2 ]
        
        let firstMainTextHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[firstMainText(>=50)]-50-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let firstMainTextVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-120-[firstMainText(==30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(firstMainTextHConstraints)
        self.view.addConstraints(firstMainTextVConstraints)
        
        let firstSubtitleTextHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-80-[firstSubtitleText(>=30)]-80-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let firstSubtitleTextVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[firstMainText]-1-[firstSubtitleText(==30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(firstSubtitleTextHConstraints)
        self.view.addConstraints(firstSubtitleTextVConstraints)
        
        let secondMainTextHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[secondMainText(>=50)]-50-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let secondMainTextVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[firstMainText]-10-[secondMainText]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(secondMainTextHConstraints)
        self.view.addConstraints(secondMainTextVConstraints)
        
        let secondSubtitleTextHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-80-[secondSubtitleText(>=30)]-80-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let secondSubtitleTextVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[firstSubtitleText]-10-[secondSubtitleText(==30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(secondSubtitleTextHConstraints)
        self.view.addConstraints(secondSubtitleTextVConstraints)
        
        let bottomMainTextHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[bottomMainText(>=50)]-50-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let bottomMainTextVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomMainText(==30)]-140-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(bottomMainTextHConstraints)
        self.view.addConstraints(bottomMainTextVConstraints)
        
        let bottomSubtitleNum1HConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-80-[bottomSubtitleNum1(>=10)]-80-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let bottomSubtitleNum1VConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomMainText]-10-[bottomSubtitleNum1(>=10)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(bottomSubtitleNum1HConstraints)
        self.view.addConstraints(bottomSubtitleNum1VConstraints)
        
        let bottomSubtitleNum2HConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-80-[bottomSubtitleNum2(>=10)]-80-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let bottomSubtitleNum2VConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomMainText]-10-[bottomSubtitleNum2(>=10)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(bottomSubtitleNum2HConstraints)
        self.view.addConstraints(bottomSubtitleNum2VConstraints)
        
        let userImageViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[userImageView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let userImageViewVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[userImageView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(userImageViewHConstraints)
        self.view.addConstraints(userImageViewVConstraints)
        
        let settingsImageViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:[settingsImageView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let settingsImageViewVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[settingsImageView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(settingsImageViewHConstraints)
        self.view.addConstraints(settingsImageViewVConstraints)
        
        let checkButtonWidthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[checkButton(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let checkButtonHeightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[checkButton(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(checkButtonWidthConstraint)
        self.view.addConstraints(checkButtonHeightConstraint)
        
        let circleViewWidthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[circleView(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let circleViewHeightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[circleView(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        self.view.addConstraints(circleViewWidthConstraint)
        self.view.addConstraints(circleViewHeightConstraint)
        
        let checkButtonHCenter = NSLayoutConstraint(item: checkButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let checkButtonVCenter = NSLayoutConstraint(item: checkButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        
        let circleViewHCenter = NSLayoutConstraint(item: circleView, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let circleViewVCenter = NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraint(checkButtonHCenter)
        self.view.addConstraint(checkButtonVCenter)
        
        self.view.addConstraint(circleViewHCenter)
        self.view.addConstraint(circleViewVCenter)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkButton.layer.cornerRadius = checkButton.bounds.width / 2.0
        checkButton.clipsToBounds = true
        
        circleView.layer.cornerRadius = circleView.bounds.width / 2.0
        circleView.clipsToBounds = true
    }
    
    func checkButtonTouchEvent(sender: AnyObject) {
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.checkButton.layer.backgroundColor = UIColor.whiteColor().CGColor
                self.checkButton.tintColor = self.greenColor
                
                self.userImageView.tintColor = UIColor.whiteColor()
                self.settingsImageView.tintColor = UIColor.whiteColor()
            
                self.bottomMainText.textColor = UIColor.whiteColor()
                self.bottomSubtitleNum1.textColor = UIColor.whiteColor()
            }, completion: nil)
        
        let circleViewScaleAnimation = JNWSpringAnimation(keyPath: "transform.scale")
        
        circleViewScaleAnimation.damping = 12.0
        circleViewScaleAnimation.stiffness = 12.0
        circleViewScaleAnimation.mass = 1.0
        
        circleViewScaleAnimation.fromValue = 1.0
        circleViewScaleAnimation.toValue = 17.0
        
        circleView.layer.addAnimation(circleViewScaleAnimation, forKey: circleViewScaleAnimation.keyPath)
        
        circleView.transform = CGAffineTransformMakeScale(17.0, 17.0)
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.firstMainText.alpha = 0.0
                self.firstSubtitleText.alpha = 0.0
            
                self.secondMainText.alpha = 1.0
                self.secondSubtitleText.alpha = 1.0
            
                self.bottomSubtitleNum1.alpha = 0.0
                self.bottomSubtitleNum2.alpha = 1.0
            }, completion: nil)
        
        let secondMainTextPushUpAnimation = JNWSpringAnimation(keyPath: "transform.translation.y")
        
        secondMainTextPushUpAnimation.damping = 30.0
        secondMainTextPushUpAnimation.stiffness = 30.0
        secondMainTextPushUpAnimation.mass = 1.0
        
        secondMainTextPushUpAnimation.fromValue = secondMainText.frame.origin.y
        secondMainTextPushUpAnimation.toValue = -10.0
        secondMainText.layer.addAnimation(secondMainTextPushUpAnimation, forKey: secondMainTextPushUpAnimation.keyPath)
        
        let secondSubtitleTextPushUpAnimation = JNWSpringAnimation(keyPath: "transform.translation.y")
        
        secondSubtitleTextPushUpAnimation.damping = 30.0
        secondSubtitleTextPushUpAnimation.stiffness = 30.0
        secondSubtitleTextPushUpAnimation.mass = 1.0
        
        secondSubtitleTextPushUpAnimation.fromValue = secondSubtitleText.frame.origin.y
        secondSubtitleTextPushUpAnimation.toValue = -10.0
        secondSubtitleText.layer.addAnimation(secondSubtitleTextPushUpAnimation, forKey: secondSubtitleTextPushUpAnimation.keyPath)
        
        secondMainText.transform = CGAffineTransformMakeTranslation(0.0, -10.0)
        secondSubtitleText.transform = CGAffineTransformMakeTranslation(0.0, -10.0)
        
        let bottomSubtitleNum2PushUpAnimation = JNWSpringAnimation(keyPath: "transform.translation.y")
        
        bottomSubtitleNum2PushUpAnimation.damping = 30.0
        bottomSubtitleNum2PushUpAnimation.stiffness = 30.0
        bottomSubtitleNum2PushUpAnimation.mass = 1.0
        
        bottomSubtitleNum2PushUpAnimation.fromValue = bottomSubtitleNum2.frame.origin.y
        bottomSubtitleNum2PushUpAnimation.toValue = -10.0
        bottomSubtitleNum2.layer.addAnimation(bottomSubtitleNum2PushUpAnimation, forKey: bottomSubtitleNum2PushUpAnimation.keyPath)
        
        bottomSubtitleNum2.transform = CGAffineTransformMakeTranslation(0.0, -10.0)
    }

}
