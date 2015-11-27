//
//  LFSideViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

@objc public protocol LFSideViewDelegate {
    optional func willPresentViewController(viewController: UIViewController?)
    optional func didPresentViewController(viewController: UIViewController?)
    optional func willHideViewController(viewController: UIViewController?)
    optional func didHideViewController(viewController: UIViewController?)
}

public extension UIViewController {
    
    public func sideViewController() -> LFSideViewController? {
        if self.isKindOfClass(LFSideViewController) {
            return self as? LFSideViewController
        }
        
        var viewController = self.parentViewController
        while viewController != nil && !(viewController!.isKindOfClass(LFSideViewController)) {
            viewController = viewController!.parentViewController
        }
        
        return viewController as? LFSideViewController
    }
}

public class LFSideViewController: UIViewController {
    
    @IBInspectable var leftSide: CGFloat = 250
    @IBInspectable var rightSide: CGFloat = 250
    
    public var animationDuration: NSTimeInterval = 0.5
    public var contentView: UIView?
    public var delegate: LFSideViewDelegate?
    public var leftViewControllerVisible: Bool = false
    public var rightViewControllerVisible: Bool = false
    
    public var leftViewController : UIViewController? {
        willSet {
            if let leftViewController = self.leftViewController {
                leftViewController.removeFromParentViewController()
                leftViewController.view.removeFromSuperview()
            }
        }
        
        didSet {
            if let leftViewController = self.leftViewController {
                self.addChildViewController(leftViewController)
                leftViewController.didMoveToParentViewController(self)
                leftViewController.view.hidden = true
                self.contentView!.insertSubview(leftViewController.view, atIndex: 0)
            }
        }
    }
    
    public var rightViewController : UIViewController? {
        willSet {
            if let rightViewController = self.rightViewController {
                rightViewController.removeFromParentViewController()
                rightViewController.view.removeFromSuperview()
            }
        }
        
        didSet {
            if let rightViewController = self.rightViewController {
                self.addChildViewController(rightViewController)
                rightViewController.didMoveToParentViewController(self)
                rightViewController.view.hidden = true
                self.contentView!.insertSubview(rightViewController.view, atIndex: 0)
            }
        }
    }
    
    public var contentViewController : UIViewController? {
        willSet {
            if let contentViewController = self.contentViewController {
                contentViewController.removeFromParentViewController()
                contentViewController.view.removeFromSuperview()
            }
        }
        
        didSet {
            if let contentViewController = self.contentViewController {
                self.addChildViewController(contentViewController)
                contentViewController.didMoveToParentViewController(self)
                self.contentView!.addSubview(contentViewController.view)
            }
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.contentView = UIView(frame: self.view.frame)
        self.view.insertSubview(self.contentView!, atIndex: 0)
    }
    
    override public func shouldAutorotate() -> Bool {
        if let topViewController = self.topViewController() {
            return topViewController.shouldAutorotate()
        }
        
        return super.shouldAutorotate()
    }
    
    override public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if let topViewController = self.topViewController() {
            return topViewController.supportedInterfaceOrientations()
        }
        
        return super.supportedInterfaceOrientations()
    }
    
    override public func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.contentView?.frame.size = size
    }
    
    private func topViewController() -> UIViewController? {
        if let contentViewController = self.contentViewController {
            if contentViewController.isKindOfClass(UINavigationController) {
                let navigationController = contentViewController as! UINavigationController
                return navigationController.topViewController
            }
        }
        
        return self.contentViewController
    }
    
    public func presentLeftViewController() {
        self.presentLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseIn)
    }
    
    public func presentRightViewController() {
        self.presentRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseIn)
    }
    
    public func hideLeftViewController() {
        self.hideLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }
    
    public func hideRightViewController() {
        self.hideRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .CurveEaseOut)
    }
    
    public func presentLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
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
    
    public func presentRightViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
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
    
    public func hideLeftViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideViewController?(self.leftViewController)
        self.leftViewControllerVisible = false
        self.hideMenuViewController(duration, dampingRatio: dampingRatio, velocity: velocity, options: options, viewController: self.leftViewController)
    }
    
    public func hideRightViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideViewController?(self.rightViewController)
        self.rightViewControllerVisible = false
        self.hideMenuViewController(duration, dampingRatio: dampingRatio, velocity: velocity, options: options, viewController: self.rightViewController)
    }
    
    private func hideMenuViewController(duration: NSTimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions, viewController: UIViewController?) {
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
    
    public func toogleLeftViewController() {
        if self.leftViewControllerVisible {
            hideLeftViewController()
        } else {
            presentLeftViewController()
        }
    }
    
    public func toogleRightViewController() {
        if self.rightViewControllerVisible {
            hideRightViewController()
        } else {
            presentRightViewController()
        }
    }
}
