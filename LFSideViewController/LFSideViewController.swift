//
//  LFSideViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class LFSideViewController: UIViewController {

    var animationDuration: NSTimeInterval = 0.5
    var leftViewControllerVisible: Bool = false
    var contentView: UIView?
    var leftViewController : UIViewController? {
        didSet {
            if let leftViewController = self.leftViewController {
                self.addChildViewController(leftViewController)
                leftViewController.didMoveToParentViewController(self)
                self.contentView!.addSubview(leftViewController.view)
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
    
    func hideLeftViewController() {
        self.hideLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }

    func presentLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat,
        velocity: CGFloat, options: UIViewAnimationOptions) {
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = 300
        }, completion: {_ in
                // TODO:
        })
    }
    
    func hideLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat,
        velocity: CGFloat, options: UIViewAnimationOptions) {
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = 0
            }, completion: {_ in
                // TODO:
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
