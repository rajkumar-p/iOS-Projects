//
//  UpAnimationViewController.swift
//  UpLikeAnimation
//
//  Created by raj on 22/11/15.
//  Copyright © 2015 diskodev. All rights reserved.
//

import UIKit

class UpAnimationViewController: UIViewController, UIScrollViewDelegate {

    var mainScrollView: UIScrollView!
    var mainViewInsideScrollView: UIView!
    var bottomMenuButton: UIButton!
    let bottomMenuButtonColor = UIColor(red: 187.0 / 255.0, green: 54.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
    var imageForBottomMenuButton: UIImage!
    var imageForBottomMenuCloseButton: UIImage!
    var bottomMenuExpanded = false
    
    var bottomMenuButtonConstraintH: [NSLayoutConstraint]!
    var bottomMenuButtonConstraintV: [NSLayoutConstraint]!
    var bottomMenuButtonHorizontalCenterConstraint: NSLayoutConstraint!
    
    var popupMenuButtons = [UIButton]()
    var popupMenuButtonsColors: [UIColor]!
    var popupMenuButtonsImages = [UIImage]()
    var popupMenuButtonsCenterConstraints = [[String: NSLayoutConstraint]]()
    var popupMenuAnglePoints = [[String : CGFloat]]()
    var angles: [Double] = [150.0, 110.0, 70.0, 30.0]
    
    let distance = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let originalBottomIconImage = UIImage(named: "BottomIcon")
        let originalBottomIconCloseImage = UIImage(named: "BottomIconClose")
        
        imageForBottomMenuButton = originalBottomIconImage!.imageWithRenderingMode(.AlwaysTemplate)
        imageForBottomMenuCloseButton = originalBottomIconCloseImage!.imageWithRenderingMode(.AlwaysTemplate)
        
        bottomMenuButton = UIButton(type: .System)
        bottomMenuButton.setImage(imageForBottomMenuButton, forState: .Normal)
        bottomMenuButton.tintColor = UIColor.whiteColor()
        
        bottomMenuButton.translatesAutoresizingMaskIntoConstraints = false
        bottomMenuButton.layer.backgroundColor = bottomMenuButtonColor.CGColor
        
        bottomMenuButton.addTarget(self, action: "bottomMenuButtonPressed:", forControlEvents: .TouchUpInside)
        
        // mainScrollView will be added to the view controller's view
        // mainViewInsideScrollView will be added to the mainScrollView
        mainScrollView = UIScrollView(frame: self.view.bounds)
        
        mainScrollView.delegate = self
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(mainScrollView)
        self.view.addSubview(bottomMenuButton)
        
        let mainViewsDict = [ "bottomMenuButton" : bottomMenuButton ]
        
        bottomMenuButtonConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:[bottomMenuButton(==50)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: mainViewsDict)
        bottomMenuButtonConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomMenuButton(==50)]-30-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: mainViewsDict)
        bottomMenuButtonHorizontalCenterConstraint = NSLayoutConstraint(item: bottomMenuButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        
        self.view.addConstraints(bottomMenuButtonConstraintH)
        self.view.addConstraints(bottomMenuButtonConstraintV)
        self.view.addConstraint(bottomMenuButtonHorizontalCenterConstraint)
        
        mainViewInsideScrollView = UIView(frame: mainScrollView.bounds)
        
        mainViewInsideScrollView.backgroundColor = UIColor.whiteColor()
        
        mainScrollView.addSubview(mainViewInsideScrollView)

        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = makeUIColor(red: 246.0, green: 36.0, blue: 89.0)
        
        mainViewInsideScrollView.addSubview(firstView)
        
        var viewsArr = [firstView]
        
        var viewsDict = [ "V0" : viewsArr[0] ]
        
        let firstViewConstraintH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[V0]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        let firstViewConstraintV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[V0(300)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict)
        
        mainViewInsideScrollView.addConstraints(firstViewConstraintH)
        mainViewInsideScrollView.addConstraints(firstViewConstraintV)
        
        let colorArr =  [
                            makeUIColor(red: 25.0, green: 181.0, blue: 254.0),
                            makeUIColor(red: 63.0, green: 195.0, blue: 128.0),
                            makeUIColor(red: 239.0, green: 72.0, blue: 54.0),
                            makeUIColor(red: 247.0, green: 202.0, blue: 24.0),
                            makeUIColor(red: 249.0, green: 105.0, blue: 14.0),
                            makeUIColor(red: 108.0, green: 122.0, blue: 137.0),
                            makeUIColor(red: 102.0, green: 51.0, blue: 153.0),
                            makeUIColor(red: 225.0, green: 124.0, blue: 142.0)
                        ]
        
        
        for index in 1...8 {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = colorArr[index - 1]
            
            viewsArr.append(v)
            viewsDict["V\(index)"] = viewsArr[index]
            
            mainViewInsideScrollView.addSubview(viewsDict["V\(index)"]!)
            
            mainViewInsideScrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[V\(index)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
            mainViewInsideScrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[V\(index - 1)]-50-[V\(index)(150)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDict))
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        bottomMenuButton.layer.cornerRadius = bottomMenuButton.bounds.width / 2.0
        bottomMenuButton.clipsToBounds = true
        
        // Add the various pop-up menus
        // Put the pop-ups under the bottomMenuButton and make alpha 0.0
        popupMenuButtonsColors =    [
                                        makeUIColor(red: 238.0, green: 53.0, blue: 64.0),
                                        makeUIColor(red: 89.0, green: 52.0, blue: 140.0),
                                        makeUIColor(red: 60.0, green: 182.0, blue: 100.0),
                                        makeUIColor(red: 243.0, green: 137.0, blue: 52.0)
                                    ]
        
        for index in 1...4 {
            popupMenuButtonsImages.append(UIImage(named: "Popup\(index)")!.imageWithRenderingMode(.AlwaysTemplate))
        }
        
        for index in 0...3 {
            let b = UIButton(frame: bottomMenuButton.bounds)
            b.translatesAutoresizingMaskIntoConstraints = false
            
            b.layer.cornerRadius = b.bounds.width / 2.0
            b.clipsToBounds = true
            b.alpha = 0.0
            b.layer.backgroundColor = popupMenuButtonsColors[index].CGColor
            
            b.setImage(popupMenuButtonsImages[index], forState: .Normal)
            b.tintColor = UIColor.whiteColor()
            
            self.view.insertSubview(b, belowSubview: bottomMenuButton)
            
            let bCenterXConstraint = NSLayoutConstraint(item: b, attribute: .CenterX, relatedBy: .Equal, toItem: bottomMenuButton, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
            let bCenterYConstraint = NSLayoutConstraint(item: b, attribute: .CenterY, relatedBy: .Equal, toItem: bottomMenuButton, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
            
            popupMenuButtonsCenterConstraints.append(["x" : bCenterXConstraint, "y" : bCenterYConstraint])
            
            self.view.addConstraint(bCenterXConstraint)
            self.view.addConstraint(bCenterYConstraint)
            
            self.view.addConstraint(NSLayoutConstraint(item: b, attribute: .Width, relatedBy: .Equal, toItem: bottomMenuButton, attribute: .Width, multiplier: 1.0, constant: 0.0))
            self.view.addConstraint(NSLayoutConstraint(item: b, attribute: .Height, relatedBy: .Equal, toItem: bottomMenuButton, attribute: .Height, multiplier: 1.0, constant: 0.0))
            
            popupMenuButtons.append(b)
            
            // Calculate the angles where the popup will be placed
            let x = bottomMenuButton.center.x + CGFloat(cos((angles[index] * M_PI) / 180.0) * distance)
            let y = bottomMenuButton.center.y - CGFloat(sin((angles[index] * M_PI) / 180.0) * distance)
            
            popupMenuAnglePoints.append([ "x" : x, "y" : y])
        }
        
        
        
        let lastView = mainViewInsideScrollView.subviews.last
        
        let lastViewWidth = lastView!.frame.origin.y
        let lastViewHeight = lastView!.frame.size.height
        
        let sizeOfLastView = lastViewWidth + lastViewHeight
        
        mainScrollView.contentSize = CGSize(width: mainScrollView.frame.size.width, height: sizeOfLastView)
    }
    
    func makeUIColor(red r: CGFloat, green g: CGFloat, blue b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    func bottomMenuButtonPressed(paramSender: AnyObject) {
        if (bottomMenuExpanded) {
            for index in 0...3 {
                popupMenuButtonsCenterConstraints[index]["x"]?.constant = 0
                popupMenuButtonsCenterConstraints[index]["y"]?.constant = 0
            }
            
            UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveEaseInOut, animations: {
                    self.mainScrollView.alpha = 1.0
                    self.mainScrollView.userInteractionEnabled = true
                
                    self.bottomMenuButton.setImage(self.imageForBottomMenuButton, forState: .Normal)
                    self.bottomMenuButton.layer.backgroundColor = self.bottomMenuButtonColor.CGColor
                
                    self.popupMenuButtons[0].alpha = 0.0
                    self.popupMenuButtons[0].layoutIfNeeded()
                
                    self.popupMenuButtons[1].alpha = 0.0
                    self.popupMenuButtons[1].layoutIfNeeded()
                
                    self.popupMenuButtons[2].alpha = 0.0
                    self.popupMenuButtons[2].layoutIfNeeded()
                
                    self.popupMenuButtons[3].alpha = 0.0
                    self.popupMenuButtons[3].layoutIfNeeded()
                }, completion: nil)
            
            bottomMenuExpanded = false
        }
        else {
            for index in 0...3 {
                popupMenuButtonsCenterConstraints[index]["x"]?.constant -= (popupMenuButtons[index].center.x - popupMenuAnglePoints[index]["x"]!)
                popupMenuButtonsCenterConstraints[index]["y"]?.constant -= (popupMenuButtons[index].center.y - popupMenuAnglePoints[index]["y"]!)
            }
            
            let delayIncrement = 0.1
            
            UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveEaseInOut, animations: {
                    self.mainScrollView.alpha = 0.3
                    self.mainScrollView.userInteractionEnabled = false
                
                    self.bottomMenuButton.setImage(self.imageForBottomMenuCloseButton, forState: .Normal)
                    self.bottomMenuButton.layer.backgroundColor = UIColor.blackColor().CGColor
                }, completion: nil)
            
            for index in 0...3 {
                UIView.animateWithDuration(0.4, delay: (Double(index) * delayIncrement) , options: .CurveEaseInOut, animations: {
                        self.popupMenuButtons[index].alpha = 1.0
                        self.popupMenuButtons[index].layoutIfNeeded()
                    }, completion: nil)
            }
            
            bottomMenuExpanded = true
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        bottomMenuButtonConstraintV[1].constant -= 180.0
        UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.bottomMenuButton.layoutIfNeeded()
            }, completion: nil)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (!decelerate) {
            pushupPopupMenuToOriginalPlace()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pushupPopupMenuToOriginalPlace()
    }
    
    func pushupPopupMenuToOriginalPlace() {
        bottomMenuButtonConstraintV[1].constant = 30.0
        UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveEaseInOut, animations: {
                self.bottomMenuButton.layoutIfNeeded()
            }, completion: nil)
    }
    
}
