//
//  LFSideViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

@objc public protocol LFSideViewDelegate {
    @objc optional func willPresentViewController(_ viewController: UIViewController?)
    @objc optional func didPresentViewController(_ viewController: UIViewController?)
    @objc optional func willHideViewController(_ viewController: UIViewController?)
    @objc optional func didHideViewController(_ viewController: UIViewController?)
}

public extension UIViewController {
    public func sideViewController() -> LFSideViewController? {
        if self.isKind(of: LFSideViewController.self) {
            return self as? LFSideViewController
        }
        
        var viewController = self.parent
        while viewController != nil && !(viewController!.isKind(of: LFSideViewController.self)) {
            viewController = viewController!.parent
        }
        
        return viewController as? LFSideViewController
    }
}

open class LFSideViewController: UIViewController {
    
    @IBInspectable var leftSide: CGFloat = 250
    @IBInspectable var rightSide: CGFloat = 250
    
    open weak var delegate: LFSideViewDelegate?
    open var animationDuration: TimeInterval = 0.5
    open var contentView: UIView?
    open var leftViewControllerVisible: Bool = false
    open var rightViewControllerVisible: Bool = false
    
    open weak var leftViewController : UIViewController? {
        willSet {
            if let leftViewController = self.leftViewController {
                leftViewController.removeFromParentViewController()
                leftViewController.view.removeFromSuperview()
            }
        }
        
        didSet {
            if let leftViewController = self.leftViewController {
                self.addChildViewController(leftViewController)
                leftViewController.didMove(toParentViewController: self)
                leftViewController.view.isHidden = true
                self.contentView!.insertSubview(leftViewController.view, at: 0)
            }
        }
    }
    
    open weak var rightViewController : UIViewController? {
        willSet {
            if let rightViewController = self.rightViewController {
                rightViewController.removeFromParentViewController()
                rightViewController.view.removeFromSuperview()
            }
        }
        
        didSet {
            if let rightViewController = self.rightViewController {
                self.addChildViewController(rightViewController)
                rightViewController.didMove(toParentViewController: self)
                rightViewController.view.isHidden = true
                self.contentView!.insertSubview(rightViewController.view, at: 0)
            }
        }
    }
    
    open weak var contentViewController : UIViewController? {
        willSet {
            if let contentViewController = self.contentViewController {
                contentViewController.removeFromParentViewController()
                contentViewController.view.removeFromSuperview()
            }
        }
        
        didSet {
            if let contentViewController = self.contentViewController {
                self.addChildViewController(contentViewController)
                contentViewController.didMove(toParentViewController: self)
                self.contentView!.addSubview(contentViewController.view)
            }
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.contentView = UIView(frame: self.view.frame)
        self.view.insertSubview(self.contentView!, at: 0)
    }
    
    override open var shouldAutorotate : Bool {
        if let topViewController = self.topViewController() {
            return topViewController.shouldAutorotate
        }
        
        return super.shouldAutorotate
    }
    
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if let topViewController = self.topViewController() {
            return topViewController.supportedInterfaceOrientations
        }
        
        return super.supportedInterfaceOrientations
    }
    
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.contentView?.frame.size = size
    }
    
    fileprivate func topViewController() -> UIViewController? {
        if let contentViewController = self.contentViewController {
            if contentViewController.isKind(of: UINavigationController.self) {
                let navigationController = contentViewController as! UINavigationController
                return navigationController.topViewController
            }
        }
        
        return self.contentViewController
    }
    
    open func presentLeftViewController() {
        self.presentLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .curveEaseIn)
    }
    
    open func presentRightViewController() {
        self.presentRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .curveEaseIn)
    }
    
    open func hideLeftViewController() {
        self.hideLeftViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .curveEaseOut)
    }
    
    open func hideRightViewController() {
        self.hideRightViewController(self.animationDuration, dampingRatio: 1.0, velocity: 0.0, options: .curveEaseOut)
    }
    
    open func presentLeftViewController(_ duration: TimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willPresentViewController?(self.leftViewController)
        self.leftViewController?.view.isHidden = false
        self.leftViewControllerVisible = true
        
        UIView.animate(withDuration: duration,
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
    
    open func presentRightViewController(_ duration: TimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willPresentViewController?(self.rightViewController)
        self.rightViewController?.view.isHidden = false
        self.rightViewControllerVisible = true
        
        UIView.animate(withDuration: duration,
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
    
    open func hideLeftViewController(_ duration: TimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideViewController?(self.leftViewController)
        self.leftViewControllerVisible = false
        self.hideMenuViewController(duration, dampingRatio: dampingRatio, velocity: velocity, options: options, viewController: self.leftViewController)
    }
    
    open func hideRightViewController(_ duration: TimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions) {
        self.delegate?.willHideViewController?(self.rightViewController)
        self.rightViewControllerVisible = false
        self.hideMenuViewController(duration, dampingRatio: dampingRatio, velocity: velocity, options: options, viewController: self.rightViewController)
    }
    
    fileprivate func hideMenuViewController(_ duration: TimeInterval, dampingRatio: CGFloat, velocity: CGFloat, options: UIViewAnimationOptions, viewController: UIViewController?) {
        UIView.animate(withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                self.contentViewController!.view.frame.origin.x = 0
            }, completion: {_ in
                viewController?.view.isHidden = true
                self.delegate?.didHideViewController?(viewController)
        })
        
    }
    
    open func toogleLeftViewController() {
        if self.leftViewControllerVisible {
            hideLeftViewController()
        } else {
            presentLeftViewController()
        }
    }
    
    open func toogleRightViewController() {
        if self.rightViewControllerVisible {
            hideRightViewController()
        } else {
            presentRightViewController()
        }
    }
}
