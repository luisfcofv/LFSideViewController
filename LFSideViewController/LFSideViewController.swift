//
//  LFSideViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

@objc protocol LFSideViewDelegate {
    optional func willPresentleftViewController()
    optional func didPresentleftViewController()
    optional func willHideleftViewController()
    optional func didHideleftViewController()
}

class LFSideViewController: UIViewController {

    var animationDuration: NSTimeInterval = 0.5
    var contentView: UIView?
    var delegate: LFSideViewDelegate?
    var leftViewControllerVisible: Bool = false

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
//        self.presentLeftViewController(self.animationDuration, dampingRatio: 0.5, velocity: 10.0, options: .CurveEaseIn)
        self.presentLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseIn)
    }
    
    func presentRightViewController() {
        self.presentRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseIn)
    }
    
    func hideLeftViewController() {
        self.hideLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }
    
    func hideRightViewController() {
        self.hideLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }

    func presentLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willPresentleftViewController?()
        self.leftViewController?.view.hidden = false
            
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = 300
        }, completion: {_ in
            self.delegate?.didPresentleftViewController?()
        })
    }
    
    func presentRightViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.rightViewController?.view.hidden = false
        
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = -100
        }, completion: {_ in
                
        })
    }
    
    func hideLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideleftViewController?()
            
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = 0
            }, completion: {_ in
                self.leftViewController?.view.hidden = true
                self.delegate?.didHideleftViewController?()
            })
    }
    
    func toogleLeftViewController() {
        if self.leftViewControllerVisible {
            hideLeftViewController()
        } else {
            presentLeftViewController()
        }
    
        self.leftViewControllerVisible = !self.leftViewControllerVisible
    }
}
