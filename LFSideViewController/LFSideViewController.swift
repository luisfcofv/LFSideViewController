//
//  LFSideViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

@objc protocol LFSideViewDelegate {
    optional func willPresentViewController(viewController: UIViewController?)
    optional func didPresentViewController(viewController: UIViewController?)
    optional func willHideViewController(viewController: UIViewController?)
    optional func didHideViewController(viewController: UIViewController?)
}

class LFSideViewController: UIViewController {

    @IBInspectable var leftSide: CGFloat = 250
    @IBInspectable var rightSide: CGFloat = 250
    
    var animationDuration: NSTimeInterval = 0.5
    var contentView: UIView?
    var delegate: LFSideViewDelegate?
    var leftViewControllerVisible: Bool = false
    var rightViewControllerVisible: Bool = false

    var leftViewController : UIViewController? {
        didSet {
            if let leftViewController = self.leftViewController {
                self.addChildViewController(leftViewController)
                leftViewController.didMoveToParentViewController(self)
                leftViewController.view.hidden = true
                self.contentView!.insertSubview(leftViewController.view, atIndex: 0)
            }
        }
    }
    
    var rightViewController : UIViewController? {
        didSet {
            if let rightViewController = self.rightViewController {
                self.addChildViewController(rightViewController)
                rightViewController.didMoveToParentViewController(self)
                rightViewController.view.hidden = true
                self.contentView!.insertSubview(rightViewController.view, atIndex: 0)
            }
        }
    }
    
    var contentViewController : UIViewController? {
        didSet {
            if let contentViewController = self.contentViewController {
                self.addChildViewController(contentViewController)
                contentViewController.didMoveToParentViewController(self)
                self.contentView!.addSubview(contentViewController.view)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView = UIView(frame: self.view.frame)
        self.view.insertSubview(self.contentView!, atIndex: 0)
    }
    
    func presentLeftViewController() {
        self.presentLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseIn)
    }
    
    func presentRightViewController() {
        self.presentRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseIn)
    }
    
    func hideLeftViewController() {
        self.hideLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }
    
    func hideRightViewController() {
        self.hideRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }

    func presentLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willPresentViewController?(self.leftViewController)
        self.leftViewController?.view.hidden = false
        self.leftViewControllerVisible = true
            
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = self.leftSide
        }, completion: {_ in
            self.delegate?.didPresentViewController?(self.leftViewController)
        })
    }
    
    func presentRightViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willPresentViewController?(self.rightViewController)
        self.rightViewController?.view.hidden = false
        self.rightViewControllerVisible = true
        
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = -self.rightSide
        }, completion: {_ in
            self.delegate?.didPresentViewController?(self.rightViewController)
        })
    }
    
    func hideLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideViewController?(self.leftViewController)
        self.leftViewControllerVisible = false
        self.hideMenuViewController(duration, dampingRatio: dampingRatio, velocity: velocity, options: options, viewController: self.leftViewController)
    }
    
    func hideRightViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideViewController?(self.rightViewController)
        self.rightViewControllerVisible = false
        self.hideMenuViewController(duration, dampingRatio: dampingRatio, velocity: velocity, options: options, viewController: self.rightViewController)
    }
    
    func hideMenuViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions, viewController: UIViewController?) {
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = 0
            }, completion: {_ in
                viewController?.view.hidden = true
                self.delegate?.didHideViewController?(viewController)
        })

    }
    
    func toogleLeftViewController() {
        if self.leftViewControllerVisible {
            hideLeftViewController()
        } else {
            presentLeftViewController()
        }
    }
    
    func toogleRightViewController() {
        if self.rightViewControllerVisible {
            hideRightViewController()
        } else {
            presentRightViewController()
        }
    }
}
